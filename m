Return-Path: <linux-doc+bounces-80679-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE4zOu9DwWnpRwQAu9opvQ
	(envelope-from <linux-doc+bounces-80679-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 14:45:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C842F339D
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 14:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3034C3023698
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 13:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A503AC0DE;
	Mon, 23 Mar 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LLUgpdW1"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB7E3AC0C4;
	Mon, 23 Mar 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273340; cv=none; b=DtkbT1s7KCu4jaH+9hbvQClYKyn2zzV+k8Htoya0c1irfgAsZXOfzVmmpyTdNbIKXGG6D3F9tGtG1QgFYpBsMyAVwoCGBC5YFIVSzdhscJC3uCkD0KWjHQzYdkZ5KyUeiBBvqhyPdFdeXBrS3DxWOn8G50+e3+Gqjpne1VMVOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273340; c=relaxed/simple;
	bh=Xul45EXTSkpTVTUpvk9cJwsqIpRkkqQ3IcrHaxWzzwU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GI+tpJkYZ34LRI/rAWN9hdEKc7MCtKbH74Fb5Z/gsBtKHw6gQx7CB7xz1y52BeedBf0FSuT1MGq93X7AOljhI3+OYngpLF3Ucolau/emJ3ghfD5+1sOtWlSvoyHSSXn1AQ9RdQyLrFV0t1R7+KEz6s2QucTqCDMyMbAsF0beiDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LLUgpdW1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DAE0840423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774273338; bh=Xul45EXTSkpTVTUpvk9cJwsqIpRkkqQ3IcrHaxWzzwU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LLUgpdW1TKyMRiNb/ZsTM0UvnjkQKotPQtVPm8cFN8vLwWq8QKpx6+JqTk4E/JqVC
	 /KoZVk0dGyZOA3LrVXqMQdTJErzWXCEofE7+pSFoNdrNvPefs98J/HXwF9X7NFf5ps
	 NFVFFTwLUtpXlEyLQeQ7AG6eS1e6f+5YRnotP/0DCb0A6AOCSwFMkYLnYhTVAAoEqe
	 ueaaOOA0o3pda2GmYIG5P6mFcF4HJlz3vwF3HvcV6ctSX4b+1gP6oVzib0pOQJAGEB
	 GSrqFmu0WjsI1ue8hVNRpEbRcdcxCBjuxm/fm/rY+BRXd14PYJOBG/tZDY/M/aSdc6
	 k4N02ghcmGjEQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DAE0840423;
	Mon, 23 Mar 2026 13:42:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Rito Rhymes <rito@ritovision.com>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
Subject: Re: [PATCH v2 0/1] docs: examples of pages affected by C API
 signature overflow
In-Reply-To: <DHA2MFSL71FH.1Z930JBKI8AOE@ritovision.com>
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260322193740.68784-1-rito@ritovision.com>
 <874im7eh6e.fsf@trenco.lwn.net>
 <DHA2MFSL71FH.1Z930JBKI8AOE@ritovision.com>
Date: Mon, 23 Mar 2026 07:42:17 -0600
Message-ID: <87jyv2br2e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80679-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60C842F339D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Rito Rhymes" <rito@ritovision.com> writes:

> Thank you for the feedback.
>
> I'll put some examples in the changelogs with versioned URLs and
> reroll them without a cover letter.
>
>> The cover letter tells reviewers what the series as a whole does
>
> Admittedly, I knew including a cover letter for a single patch was
> non-standard. Given the quantity of examples I aimed to include,
> I didn't think it acceptable to include it all in the changelog, but I
> knew having the examples was important for testing, so I repurposed the
> cover letter as the vehicle for including them. I'll lay off that.

If you want to include extra information for reviewers that doesn't
belong in the changelog, you can put it below the "---" line and it will
be stripped out at application time.

Thanks,

jon

