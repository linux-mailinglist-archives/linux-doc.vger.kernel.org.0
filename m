Return-Path: <linux-doc+bounces-86707-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PooOWS3AGplLwEAu9opvQ
	(envelope-from <linux-doc+bounces-86707-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 18:50:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B26505351
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 18:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD77D3001CEC
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 16:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4B83AE71C;
	Sun, 10 May 2026 16:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T1unUNEh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UWB3vSQB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4D388E72;
	Sun, 10 May 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778431836; cv=none; b=XlG4bfHz5KYZoZZA1+DfM6at9dps7uT8X7BfAtRBBdvBWr7RY+Ue0zvRnwf+zxJ3LD4uoPlYmMtHitkw90eNVks/nJFLXceMJcXrD9ggdu3JvSXW1c9dapu+Im6t3/QDn5u9a01h7TN6BXicNq7vDC6ks2f/O8IX5kzq8RS2ncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778431836; c=relaxed/simple;
	bh=IXQJhGywu8OwXjC8G52ZXriPYdv9LYDsfuilc/Q0trc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iacxjt6duISlyO2bltG+6yoZV9Dqh2J3oy1EHR8YSN3gG8h3sMmcofVZsg2dTtrU/MIt+9nQ8P9fQvNtwmSNueYut8+GpJFJIvQdIKEmmz8uvMNDKN8UlYaGhY01NC3b/n3Z9aXwfTIB1yPyCgF3/WYdYilG58bYT6IsREI0cFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T1unUNEh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UWB3vSQB; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gD8486mKmz9tbP;
	Sun, 10 May 2026 18:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778431833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IXQJhGywu8OwXjC8G52ZXriPYdv9LYDsfuilc/Q0trc=;
	b=T1unUNEhVA5JFbX//mClpXR99QtS9UMVo4bvQnXsWF5sgGL+inIMTfQ7Z1o+pJTtFJlwyI
	XTkrX1NKmY9StkiMKuX3ZG8gAioxu66ns1wkqr3LqaEnSS1KtMG1T07mkO4GClYnAsp+Bu
	YCVsWR1nYirxBCulT3oBK2MMyrZO1NMwCBWLIwwqZiz4qLEsoMvM0Hz8A90uZ5EdruwBh4
	nJYXPCOLrxUMJwP3Gmh1d0dwW9ujZ0cWahwWpoikR6j/MCftD3j8M11wWnsITe/q+JXqfz
	RYCDsfE8DhEfGzvyRVzEksjRPAXxub2USUe15MQTKR//O8BtxfehBTiQ0ZzT7A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=UWB3vSQB;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778431831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IXQJhGywu8OwXjC8G52ZXriPYdv9LYDsfuilc/Q0trc=;
	b=UWB3vSQBvsVCOQpfPjrccujR1sSFzQD4Qq+vhffPb0aLgnsQuG66IS23pq4L7E5mWDY2SU
	yFHSl5II4dHcFg2bdLW++rgSY0PIz0MOwiVWT+fHK3rPdUTzq6luy6gyPG5e4Rk4StoTeq
	qGLLXjGNp5ysf3b6YaSGxXpHfnPv25qmRNPUu8/tQ5UtmePnUtANPa0JsGQB0UqXWm+zd2
	p2OOHUyKTp7y3Yj4zWbv/HyKDFYKWyEQNdrC8z8rFWDVOeKaqlTdNM1S5ND9x/RMPZb7YW
	UCHAf7SknwARulK58ykPedo9VSWdqZc7HYB0xUyWcTX5agfKf3AFxPzmtbAAhA==
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH 0/2] Doc, scripts: facilitate phaseout of strlcat
Date: Sun, 10 May 2026 18:49:08 +0200
Message-ID: <20260510164907.57176-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4xnmjqp5ts9o1wbi8pn6di31ncgpkhhy
X-MBO-RS-ID: a713215e6905348f243
X-Rspamd-Queue-Id: E9B26505351
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86707-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lwn.net,linuxfoundation.org,canonical.com,perches.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Action: no action

The goal of this series is to facilitate the transition from strlcat to better
alternatives.

