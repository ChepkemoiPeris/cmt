SELECT s.service_name as Department, CASE WHEN ts.status=1 THEN "Open" WHEN ts.STATUS=2 THEN "Resolved" ELSE "Close" as STATUS  END,
case when datediff(ts.created_at,Now())=7 else 0 end STATUS1

 from tickets ts, client_result cr, services s 
 
 where ts.id=cr.ticket_id and cr.service=s.id;