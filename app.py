import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go

st.set_page_config(layout="wide")

st.title("Financial Data Analysis")

# --- Specify your quarterly file paths here ---
sales_q_file_path = 'data/quarter_sales.csv'
expenses_q_file_path = 'data/quarter_expenses.csv'
pbt_q_file_path = 'data/quarter_pbt.csv'
pat_q_file_path = 'data/quarter_pat.csv'
eps_q_file_path = 'data/quarter_eps.csv'
# ---------------------------------------------

# --- Specify your annual file paths here ---
sales_a_file_path = 'data/annual_sales.csv'
expenses_a_file_path = 'data/annual_expenses.csv'
pbt_a_file_path = 'data/annual_pbt.csv'
pat_a_file_path = 'data/annual_pat.csv'
eps_a_file_path = 'data/annual_eps.csv'
# -------------------------------------------

def load_and_melt(file_path, metric):
    try:
        df = pd.read_csv(file_path)
        tickers.update(df['ticker'].unique())
        df_melted = df.melt(id_vars=['ticker'], var_name='date', value_name='value')
        df_melted['date'] = pd.to_datetime(df_melted['date'], errors='coerce')
        df_melted = df_melted.dropna(subset=['date', 'value'])
        df_melted['value'] = pd.to_numeric(df_melted['value'])
        return metric, df_melted
    except FileNotFoundError:
        st.error(f"{metric} data file not found at: {file_path}")
        return metric, None

def create_styled_plot(df, metric, time_period):
    """Create a styled Plotly line chart with consistent labeling and no legend."""
    fig = px.line(
        df,
        x='date',
        y='value',
        color='ticker',
        title=f"{time_period} {metric}",
        labels={'value': metric, 'date': 'Date', 'ticker': 'Company'}
    )
    fig.update_layout(
        title_font_size=16,
        xaxis_title_font_size=14,
        yaxis_title_font_size=14,
        font=dict(family="Arial", color="#333333"),
        showlegend=False  # Disable legend on individual plots
    )
    return fig

def create_legend_plot(tickers):
    """Create a standalone legend plot for selected tickers, ensuring no scrollbar."""
    fig = go.Figure()
    # Create dummy traces for each ticker to populate the legend
    for ticker in tickers:
        fig.add_trace(go.Scatter(
            x=[None], y=[None],  # No data to plot
            name=ticker,
            mode='lines',
            line=dict(width=2)  # Match Plotly Express line style
        ))
    fig.update_layout(
        title="",
        showlegend=True,
        legend=dict(
            orientation="h",
            yanchor="bottom",
            y=0.9,  # Position legend near top to avoid clipping
            xanchor="center",
            x=0.5,
            tracegroupgap=0,
            font=dict(family="Consolas", size=15, color="#ffffff")
        ),
        # Hide axes and grid
        xaxis=dict(visible=False),
        yaxis=dict(visible=False),
        plot_bgcolor="rgba(0,0,0,0)",
        paper_bgcolor="rgba(0,0,0,0)",
        height=100,  # Increased height to accommodate all tickers
        margin=dict(l=10, r=10, t=40, b=10)  # Minimal padding to fit content
    )
    return fig

data_quarterly = {}
data_annual = {}
available_metrics = []
tickers = set()

# Load Quarterly Data
with st.spinner("Loading quarterly data..."):
    results_q = [
        load_and_melt(sales_q_file_path, 'Sales'),
        load_and_melt(expenses_q_file_path, 'Expenses'),
        load_and_melt(pbt_q_file_path, 'PBT'),
        load_and_melt(pat_q_file_path, 'PAT'),
        load_and_melt(eps_q_file_path, 'EPS'),
    ]
    for metric, df in results_q:
        if df is not None:
            data_quarterly[metric] = df
            if metric not in available_metrics:
                available_metrics.append(metric)

# Load Annual Data
with st.spinner("Loading annual data..."):
    results_a = [
        load_and_melt(sales_a_file_path, 'Sales'),
        load_and_melt(expenses_a_file_path, 'Expenses'),
        load_and_melt(pbt_a_file_path, 'PBT'),
        load_and_melt(pat_a_file_path, 'PAT'),
        load_and_melt(eps_a_file_path, 'EPS'),
    ]
    for metric, df in results_a:
        if df is not None:
            data_annual[metric] = df

if data_quarterly and data_annual:
    common_tickers = sorted(list(tickers))
    selected_tickers = st.multiselect("Select companies:", common_tickers)

    selected_metrics = st.multiselect("Select metrics to display:", available_metrics, default=available_metrics)

    if selected_tickers:
        # Display the shared legend at the top
        # st.subheader("Company")
        legend_fig = create_legend_plot(selected_tickers)
        st.plotly_chart(legend_fig, use_container_width=True)

        num_cols = len(selected_metrics)
        if num_cols > 0:
            st.subheader("Quarterly Data")
            cols_q = st.columns(num_cols)
            for i, metric in enumerate(selected_metrics):
                if metric in data_quarterly:
                    df_filtered_q = data_quarterly[metric][data_quarterly[metric]['ticker'].isin(selected_tickers)]
                    if not df_filtered_q.empty:
                        fig_q = create_styled_plot(df_filtered_q, metric, "Quarterly")
                        cols_q[i].plotly_chart(fig_q, use_container_width=True)
                    else:
                        cols_q[i].warning(f"No quarterly data for selected companies in {metric}.")
                else:
                    cols_q[i].info(f"Quarterly {metric} data not loaded.")

            st.subheader("Annual Data")
            cols_a = st.columns(num_cols)
            for i, metric in enumerate(selected_metrics):
                if metric in data_annual:
                    df_filtered_a = data_annual[metric][data_annual[metric]['ticker'].isin(selected_tickers)]
                    if not df_filtered_a.empty:
                        fig_a = create_styled_plot(df_filtered_a, metric, "Annual")
                        cols_a[i].plotly_chart(fig_a, use_container_width=True)
                    else:
                        cols_a[i].warning(f"No annual data for selected companies in {metric}.")
                else:
                    cols_a[i].info(f"Annual {metric} data not loaded.")
        else:
            st.info("Please select at least one metric to display.")
    else:
        st.info("Please select at least one company to display the plots.")
else:
    st.info("Please make sure the financial data files are in the correct location and named appropriately.")