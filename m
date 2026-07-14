Return-Path: <linux-doc+bounces-96654-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TTR8CRzKVWoPtQAAu9opvQ
	(envelope-from <linux-doc+bounces-96654-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 07:33:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C24C75128D
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 07:33:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=suksangroup.co.th header.s=default header.b=WOaJXYAB;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96654-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96654-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=inbox.org (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 866A7300C7E0
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 05:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A1A32142B;
	Tue, 14 Jul 2026 05:24:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96313264C1
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 05:24:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006665; cv=none; b=tZ111ecwqg4J2QB++7LA85BLt616K5fFERy2hPlN2whTtbgzQGUAl5mYvZbiRFGwyiSfWsQ4+H0aNrvxue4epKWwx4jgTaqzbVv+10DOOmNpL5i9AAWFGsS/UCeQGw3XAuL6NP8HFGDD0jsd6VGZ/7HVixbfboCZeZDC5FIqmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006665; c=relaxed/simple;
	bh=50htdNoK+zWbWJGeWWdQTw8t2T4Cnvevjw4NK/nxzvI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jq8rMIlaCqvbQECPQ5k+nmTotBSCjSChjf7EiRjQhi/5H3LWDXkuJ7t3y9vhbntQxNO6KNpxTmA246hBYtX/FQAhhDAvC5WLQfYZrCw8Lbdj8pQl9B/P2qK7pnzy/MbztM1oSMSUECd0vO6RZ7hycFIkPUU/JWS5vrsL9qz+zRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=WOaJXYAB; arc=none smtp.client-ip=103.13.31.55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=50htdNoK+zWbWJGeWWdQTw8t2T4Cnvevjw4NK/nxzvI=; b=WOaJXYABUY2vTCNlcfY+Ldrxw3
	e2QxB8P3XkiNI26noJZzBhhPfqMHVHt7KkPrytURnCjVMSNviglMdgEFJ+BwO7C1YGtnfmsM4MWzs
	6+eI6bXalR3qdXlhaY4Q2FvBAwwCNWRRPYV+yjSXMr7t2pTmlEIn9DkxGUHDFO8LZwWh+q7TOgK8u
	LjmXs4SuJPtedpx4DJQFiQjBqlX9/d4vagtMYX3NyflT/su0RGP22EaFiD/7bKz8ID5+r7TjnkaGH
	8yT2DOC4dpDgjNU03qC6rs7JrNqKV/Jk6X8yCm+xAWxh0AprxTw/fUb+gMR/pK5q05m+K4ENmpZby
	HyMt+Ubw==;
Received: from [207.189.26.187] (port=63263)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVd0-0000000Fx9o-2KbV
	for linux-doc@vger.kernel.org;
	Tue, 14 Jul 2026 12:24:21 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: linux-doc@vger.kernel.org
Subject: Dear linux-doc, project info
Date: 14 Jul 2026 00:24:18 -0500
Message-ID: <20260714002417.34A6B0924C178719@inbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.94 / 15.00];
	ABUSE_SURBL(5.00)[lexcapitalgrowth.com:replyto];
	R_DKIM_REJECT(1.00)[suksangroup.co.th:s=default];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[inbox.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96654-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_AS(0.00)[smtp@suksangroup.co.th];
	GREYLIST(0.00)[pass,body];
	HAS_X_SOURCE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_GMSV(0.00)[smtp@suksangroup.co.th];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[info@inbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@inbox.org,linux-doc@vger.kernel.org];
	HAS_REPLYTO(0.00)[hanns.schofield@lexcapitalgrowth.com];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	DKIM_TRACE(0.00)[suksangroup.co.th:-];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lexcapitalgrowth.com:replyto,inbox.org:from_mime,inbox.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C24C75128D


Re:Good day linux-doc,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA



