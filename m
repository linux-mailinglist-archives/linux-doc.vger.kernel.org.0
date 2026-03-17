Return-Path: <linux-doc+bounces-79777-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJg1NtlvuWm8EgIAu9opvQ
	(envelope-from <linux-doc+bounces-79777-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 16:14:33 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB232ACC56
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 16:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CED213064906
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9511B3EAC69;
	Tue, 17 Mar 2026 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XJFgT1yr"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA32DCC1C;
	Tue, 17 Mar 2026 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760121; cv=none; b=oHpuiGvHpz00mRlbHOihLfIUSwSNXdIdSXCIxxj6zwrPbo+6bMEZzrshHVrJwZIe5Z7NUkhPJ0jciMT53FhsBrlqLHb21o4/DYM2a7Y2Efc/+TkugJnIeY8Vlhpx2ViGw5UPuqWR4xZzCHiUfTm9lLDUmJOX4G0736s+Tj4YtCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760121; c=relaxed/simple;
	bh=VFoALqe8rtJCDOkT4+H1O72SLy/sjIzsK4vg18Yt1Mc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KngLZNRGffhCnXjO0MY76GjHyLwiWZVs51+8lVqSgGIongwjKVnVo2rOS47XsIY3gpjWMzAxs66KzuhtuppS3/hUYsiAI8N2cBFriUI5XiDfY1efmGHJByHLmkafBUg30s3e16V87+Z07vvmLglezNm4o/9Drq6x72QhSyDWVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XJFgT1yr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BC9F540C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773760119; bh=8vYKfYBoiRGStpn90uHCaibqaDnfD6D3sJs+W1L1KSQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XJFgT1yrcmo4VEKMVJAvQggVD2E+NWmkisMgpPbG2rTtGvp37ssnqKOE25ENl8MnN
	 U48Sjk8c1or7M1D6W/ysBMT6PMIrAdwE+QxyERHcutUtMox0Zn71VZ8+DTVHlQ85bP
	 UsHGjhO660dGRyqJ4PzxJqYwPx8v5lS8USkqL71Oj20bPMzc+xR1pFGx806czzGwTH
	 4E5QfdE7KlhsRXw9knf456U0b6LUa1bMNmMKBNXhprGKojb/zQ4N0fXu7c78rip+y8
	 g91qu4TV1onSNweAMAjziotcxYSWZCkABMjAYXi9UYKri8RSs1WPjoDgkHMvLUT6L8
	 42sFVbmyPPGXw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BC9F540C7C;
	Tue, 17 Mar 2026 15:08:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@airmail.cc>
Subject: Re: [PATCH v4 0/4] workflow, scripts: sort changes.rst and ver_linux
In-Reply-To: <20260311164935.183495-3-manuelebner@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
Date: Tue, 17 Mar 2026 09:08:38 -0600
Message-ID: <87zf46biix.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79777-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[airmail.cc,gmail.com,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,airmail.cc:email]
X-Rspamd-Queue-Id: 7BB232ACC56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Manuel Ebner <manuelebner@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system (scripts/ver_linux) with the minimal required versions (changes.rst).
> Sorting both lists the same way makes side-by-side comparisons a simple task.

As noted in the individual patches, we're getting closer, but not quite
there yet.

Also, overall, I am still not thrilled about you having send me patches
under a false name.  I need you to, at a bare minimum, acknowledge that
this was a violation of the trust that the kernel project depends on,
and that the current name you are using is the real one.

Thanks,

jon

