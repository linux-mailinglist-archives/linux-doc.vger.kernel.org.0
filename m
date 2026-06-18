Return-Path: <linux-doc+bounces-92737-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VTxYKDCxM2qDFAYAu9opvQ
	(envelope-from <linux-doc+bounces-92737-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 10:49:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9E69E96B
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 10:49:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92737-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92737-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27FE83082C12
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 08:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F023B42E9;
	Thu, 18 Jun 2026 08:41:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bregans-1.gladserv.net (bregans-1.gladserv.net [185.128.211.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409EC20E334;
	Thu, 18 Jun 2026 08:41:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772112; cv=none; b=HtUmM35Tzmy9lWJmSQutHu5pNsgNGQOLxrhRZpuLClfYqeMvnY0RECn/lLtKKkvJ02PZH/AXiy+FpolxHb3vJw6FGYb0Fxx1OjQDGhggOUF2E+D9O5lk5rl+YtpHwuFD6ojIwaQC77nWm/f+qyK1U8mJuhxXcjwCiZdKySIVicU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772112; c=relaxed/simple;
	bh=Pz2p1RkeXj7eHQl9ET4dpxIJp/dDvVTUnZlDz4X3rWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=C4qpxCjxWPVyZiwSdH8MSXcdvYQVuI5Ruh6f/16QSsYAD4fWs1wSlAfQI7iL6EbFIJBPQgJgVJcm/MUKrwGetdDRWqrJwhi5dFr28ZA7Eye4X7uwSbyJHE4kUUBMXTqjLNCfTFMh0HUNHhrRQqMm6H4KYqtgOy/MCU1S1CO/sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=librecast.net; spf=pass smtp.mailfrom=librecast.net; arc=none smtp.client-ip=185.128.211.58
Date: Thu, 18 Jun 2026 10:41:36 +0200
From: Brett Sheffield <bacs@librecast.net>
To: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
Message-ID: <ajOvQKne74gN-7Y2@karahi.librecast.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865def83-a07e-4eba-b795-7da66e0e2d69@linuxfoundation.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[librecast.net];
	TAGGED_FROM(0.00)[bounces-92737-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:rafael@rcpassos.me,m:shuah@kernel.org,m:corbet@lwn.net,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bacs@librecast.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bacs@librecast.net,linux-doc@vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,rcpassos.me:email,librecast.net:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4F9E69E96B

>On 6/17/26 19:03, Shuah Khan wrote:
>> On 6/17/26 17:57, Rafael Passos wrote:
>>> This link in the docs point to a wiki that is no longer active.
>>>
>>> The wiki was moved to archive.kernel.org, and there is a warning:
>>> "OBSOLETE CONTENT This wiki has been archived and the content is
>>> no longer updated."
>>>
>>> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
>>> ---
>>>
>>>   Documentation/dev-tools/kselftest.rst | 5 -----
>>>   1 file changed, 5 deletions(-)
>>>
>>> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
>>> index d7bfe320338c..64c0ec7428a2 100644
>>> --- a/Documentation/dev-tools/kselftest.rst
>>> +++ b/Documentation/dev-tools/kselftest.rst
>>> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is important to keep
>>>   code that can still test an older kernel and make sure it skips the test
>>>   gracefully on newer releases.
>>> -You can find additional information on Kselftest framework, how to
>>> -write new tests using the framework on Kselftest wiki:
>>> -
>>> -https://kselftest.wiki.kernel.org/
>>> -
>>>   On some systems, hot-plug tests could hang forever waiting for cpu and
>>>   memory to be ready to be offlined. A special hot-plug target is created
>>>   to run the full range of hot-plug tests. In default mode, hot-plug tests run
>>
>>
>> Looks good to me.
>>
>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>
>Jon,
>
>I can take this through kselftest tree as I usually do.
>
>thanks,
>-- Shuah

Hi Shuah, Jon et al,

I've been trying to get the same change merged since August 2025:

https://lore.kernel.org/linux-doc/20250824075007.13901-2-bacs@librecast.net/

resent in January:

https://lore.kernel.org/linux-doc/20260115172817.7120-1-bacs@librecast.net/

It's great that this trivial fix is finally getting merged, but can someone
explain why this patch was accepted in preference to the one I sent in August?




Brett Sheffield (he/him)

