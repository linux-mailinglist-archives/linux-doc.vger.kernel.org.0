Return-Path: <linux-doc+bounces-85567-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB61K6xn92nWhAIAu9opvQ
	(envelope-from <linux-doc+bounces-85567-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:20:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC984B6386
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 579273008D18
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 15:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8D329ACF6;
	Sun,  3 May 2026 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OtrTiV6d"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EEB294A10;
	Sun,  3 May 2026 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777821609; cv=none; b=FcJgWFaBOhoJA92Vn81f0owHneCiQb6f3AinLZE6mWzTqt4efmwkSINCPBbv0n85Y6FvezdDUwCqOTmxeKrDslmrfrQguce7RddYRob3gZr1x417ECr+AemtZqJUlYuFwmzCkvWvwZ0pjrvpdrmLmrSN47TNNfOmYN7HrAyaIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777821609; c=relaxed/simple;
	bh=9ZQLZrpN6NElVWbLzuO0+GvkcQGqZk0/OsuHr2gFPS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cMNZUevaeQbp0iFF17AOZDa/XJ/Ov6emlgmB18Oa7hwwoKpnNMdZnRiJwOfye6UY2KnOZZ7v2p1E+A9vLiPKH5GvaxYaGmOE/yvCpmG9f287911kVwiv1YOvjq7QqBLXcavb/M65QmWBEsSnT8+OKJ0HKQClQQac/pXmwoktA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OtrTiV6d; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5631341202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777821607; bh=hyfQhY3k7z88MNS6iDnDpL/YX26gYfj5GP8756dXVhM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OtrTiV6dkVylcA+7ksi20vpk/wA/C644ENcRHpzt2R35cZvRxYyvfLCDuEaLjM7UZ
	 8gBp8DUouskYUu9Juj8ojbF2hGvON0k0m0dfPrOlYmUL7uFUy1BwncVsKkJ0FfB7il
	 QNnKLt00YsC21HmWKwedU3txcHUhdo88bpuAPK66862ZnM85kqU2MMwliboYkDrOGC
	 fJHkcfUKYI/kFAMGdomN8QDy7UgIOoOrZIr/JbQlLd8QhUGqzZoFsnOPKrvAQWPdcO
	 i88sGE4Y08vHGBPrnFJRDDj5fP0FMWV65G1o+xybzQluch9W6+5LUoZk+dXBAjA2t7
	 lFhKE907ZI9zg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5631341202;
	Sun,  3 May 2026 15:20:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Guenter Roeck <linux@roeck-us.net>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/5] docs: watchdog: general cleaning and corrections
In-Reply-To: <7a5971b2-e067-40cb-8d15-aaf1926af3c3@roeck-us.net>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
 <875x7cddye.fsf@trenco.lwn.net>
 <3de4c724-39bf-47f9-bf43-49552bc60a3a@infradead.org>
 <8161ef45-be1a-41e2-a22b-a12d6b9df666@infradead.org>
 <7a5971b2-e067-40cb-8d15-aaf1926af3c3@roeck-us.net>
Date: Sun, 03 May 2026 09:20:05 -0600
Message-ID: <87tssobjve.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 1AC984B6386
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85567-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,lwn.net:dkim,roeck-us.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Guenter Roeck <linux@roeck-us.net> writes:

> On 4/30/26 15:14, Randy Dunlap wrote:
>> Hi Wim,
>> 
>> On 3/22/26 5:54 PM, Randy Dunlap wrote:
>>>
>>>
>>> On 3/3/26 9:23 AM, Jonathan Corbet wrote:
>>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>>>
>>>>> Fix some obvious issues in the watchdog documentation files.
>>>>> I didn't try to fix every little niggling mistake.
>>>>>
>>>>>   [PATCH 1/5] docs: watchdog: mlx-wdt: small fixes
>>>>>   [PATCH 2/5] docs: watchdog: pcwd: fix typo and driver info.
>>>>>   [PATCH 3/5] docs: watchdog-api: general cleaning
>>>>>   [PATCH 4/5] docs: watchdog-kernel-api: general cleanups
>>>>>   [PATCH 5/5] docs: watchdog-parameters: add missing watchdog_core parameters
>>>>>
>>>>>   Documentation/watchdog/mlx-wdt.rst             |    4 -
>>>>>   Documentation/watchdog/pcwd-watchdog.rst       |   19 +++++--
>>>>>   Documentation/watchdog/watchdog-api.rst        |   38 +++++++--------
>>>>>   Documentation/watchdog/watchdog-kernel-api.rst |   20 +++++--
>>>>>   Documentation/watchdog/watchdog-parameters.rst |   11 +++-
>>>>>   5 files changed, 58 insertions(+), 34 deletions(-)
>>>>
>>>> Wim, do you want to pick these up, or should I take them through the
>>>> docs tree?
>>>
>>> Wim, are you active?  Can you reply and/or merge these?
>> 
>> What's happening with these 5 patches?
>> 
>
> It looks like Wim did not send a pull request for watchdog this time around/
> Wim, are you still active, or should I send pull requests going forward ?

OK, rather than let these languish further, I've just applied them.

Thanks,

jon

