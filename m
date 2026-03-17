Return-Path: <linux-doc+bounces-79776-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NyxDJxuuWm8EgIAu9opvQ
	(envelope-from <linux-doc+bounces-79776-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 16:09:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E34982ACB50
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 16:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0860304A0D5
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28293EAC69;
	Tue, 17 Mar 2026 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ETdCAe3Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76753E3C5D;
	Tue, 17 Mar 2026 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759959; cv=none; b=fe3WFFrS/YilEAZFhxI6Glnwu/efdlcivUczawJA0EOo+cSyj9xxDZLRxCDB+hNCPPTIYNQa+gJE+IKPME8XsM9S+dt5X3onxewBEkefYbfvkZaHp1iRtQPIR547rBS5dZ6gSJBzomtcbbukpaZyXCl9yu/w+UkiT2pLfvHKZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759959; c=relaxed/simple;
	bh=MX3WCxaiQASDTLsC5NMpwSqJSWncFo8CQIqLXa1xBBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ms8CMSS1IIWfAxFQ93XpphH+PSsqdEAeYM/H/3+tiWi4G/ksYf6rYCV0slNr3DyDS7xG9GK/xbtb3WxO8qhdECzgfNwKR7Udum3QZhASwwoi8u1VjxcMdEKc1y/GMa+DQ8tF9G11ow7KF8ZNpH6QmT1KPBv3JYxRLxQclvIkYmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ETdCAe3Y; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3ACAC40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773759958; bh=MX3WCxaiQASDTLsC5NMpwSqJSWncFo8CQIqLXa1xBBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ETdCAe3YHmGKwtQaLgQmW4vvr1BGvgYX3GD9dHDozwKTddhpkPyMYrp0PRR9r44hl
	 KK7eD2X3wTh8XajiEh3Q9zKvsfQ6X3ppbK2+G9R9tAhmzzV5cklujCYJNtsh6noKWI
	 4x1VdmDqIz8yBKjNi8z7t9yFXO8zmHr3GsTe+T82TPbv/cMhpHyfJIiARkIHBjy7WM
	 sK/+gxUp1psm82v7m8UUkBWS3pTAwc0hBGeT4rJTYeA+oiVENH1AMjmVtFiOpszVoX
	 mT0GTtvpzskpnAZsO/cF1qAhz9I3rETR4Ztlt2F/3WFm7Tjr0jzzK42kSnChUw/tF1
	 CBXhnq/iOPh1Q==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3ACAC40C7C;
	Tue, 17 Mar 2026 15:05:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@airmail.cc>
Subject: Re: [PATCH v4 4/4] workflow: process/changes.rst: sort list
In-Reply-To: <20260312002607.191358-2-manuelebner@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
 <20260312002607.191358-2-manuelebner@airmail.cc>
Date: Tue, 17 Mar 2026 09:05:57 -0600
Message-ID: <874imecx7u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79776-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[airmail.cc,gmail.com,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DM_SURBL(0.00)[airmail.cc:email];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,airmail.cc:email,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: E34982ACB50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Manuel Ebner <manuelebner@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system (scripts/ver_linux) with the minimal required versions.
> Sorting both lists the same way makes side-by-side comparisons a simple task.
>
> sort output alphabetically

Need I say that providing identical changelogs for two different patches
is a sign that something isn't quite right?

The change itself looks fine.

Thanks,

jon

