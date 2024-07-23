CREATE VIEW new_invoice_view as
SELECT
	a.amount as total_amount,
	sum(case when b.description = 'carnes' then b.amount else 0 end) as 'carnes',
	sum(case when b.description = 'cereales' then b.amount else 0 end) as 'cereales',
	sum(case when b.description not in ('carnes', 'cereales') then b.amount else 0 end) as 'others'
	FROM
	    "invoice" as a
	LEFT JOIN
	    invoice_items as b
    ON
	    a.id = b.auto_transfer
	GROUP BY
	    a.id