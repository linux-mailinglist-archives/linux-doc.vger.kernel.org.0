Return-Path: <linux-doc+bounces-96115-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UFGBMdcWUGqFtAIAu9opvQ
	(envelope-from <linux-doc+bounces-96115-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 23:47:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A92735E13
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 23:47:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Xqn+x/t0";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96115-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96115-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47B483013D52
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 21:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349293CEBBD;
	Thu,  9 Jul 2026 21:46:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368DA3C1402;
	Thu,  9 Jul 2026 21:46:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633619; cv=none; b=cE0PCz1/ZnXSPovwgcGwJDiOJ4WNNiVPxMDwfV6rd965/c37BBgazDJSHwv3nX9AP5GgY15xaeVedcYmZPCg1/xagP6CA0/Ib6fE82dMrskpKLplc6EeaPGDeX/YGWE19PBWNc45oqQySedhpQ00yuKCYZj84/omWb/ziLYXTn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633619; c=relaxed/simple;
	bh=kcnAtQsm2op7NRtVRRuiXyKwECaSEWuTBk2ImF4moDo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=KvRjrjE5Nj/QUYC+WeBencOL6Qxl1mlJncX49ILh7IN585jhU7PCEXbLSWMoja8M6TtEHHYWXY7oN5sFSkJtADtkZ2MNra7C2aOe7b4Rdb1ie/A5gpB0AbswZIP6NXJQxUFEyXhCo0lNuki1cpR+7Saqk6SJsxZWuSxRTipaGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xqn+x/t0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED9B1F000E9;
	Thu,  9 Jul 2026 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783633617;
	bh=kcnAtQsm2op7NRtVRRuiXyKwECaSEWuTBk2ImF4moDo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xqn+x/t0FvGVHYhAICETQRYhf6PSo0QrmDqV6fxCpsd2yT6RvAEi0lKxYK7ZPacgN
	 9PUBIOpqdC08O32wDWS1AdZGKwjQYOR295xcoijNVRCRxymHfBHaz6jRow/QbU4nN2
	 dJ/ELnWy7ANMMa+rwlNU/pi55e+lPPJKNeEOk7S1KlhnhrB/ZU1aAjaKwFSAOEvWRF
	 UWRPu3IurUeKxHRHFTO2hEW5NzZvL8dB4tceEPtcBp9yqe/lgJHVNyr67YNfSQqg27
	 Xq8TRi5iCNdhnzZgxHmmIn0o16K75+Piwvbq5AASx0x6jRmpMsAMN5kS38+A6HIckS
	 nhkWXgTYcQrNQ==
Date: Thu, 09 Jul 2026 11:46:56 -1000
Message-ID: <1e9799a107d304282794ca51b13906a7@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Silvio Fricke <silvio.fricke@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: workqueue: Fix bracket
In-Reply-To: <20260709142939.404290-2-manuelebner@mailbox.org>
References: <20260709142939.404290-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lwn.net,linuxfoundation.org,infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96115-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:jiangshanlai@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:silvio.fricke@gmail.com,m:rdunlap@infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:silviofricke@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tj@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17A92735E13

Hello, Manuel.

Applied to wq/for-7.3. I dropped the Fixes tag. It's unnecessary for a
doc typo and pointed at the wrong commit.

Thanks.
--
tejun

