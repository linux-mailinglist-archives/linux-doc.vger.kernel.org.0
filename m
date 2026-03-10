Return-Path: <linux-doc+bounces-78543-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CuATMANjr2ltWwIAu9opvQ
	(envelope-from <linux-doc+bounces-78543-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 01:17:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381B242F30
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 01:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A60973062FA2
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 00:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05651A3164;
	Tue, 10 Mar 2026 00:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imag.fr header.i=@imag.fr header.b="NIc6lULV"
X-Original-To: linux-doc@vger.kernel.org
Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A972618;
	Tue, 10 Mar 2026 00:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.77.200.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101824; cv=none; b=UkL7xs5W9J5+cRzDXXfxUk83Bz3gI0EeiVkQLwcVP+4TmEq0G3+RGQm8go+BBIAk8cJ7CFVKr3IwxBgbcv7VqXPPSd+azVEtCFyRFrz7PH8aEM/rXmMao4D+6k0Ol1jkg7F35EklhyA+CVOg34Cgh5DiulUtwldx4Gw8dcYRuVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101824; c=relaxed/simple;
	bh=K6KOjirwWu6hxLyRAT0WLc1dq0LGNWS7j6XYIxLCRp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2EYQ8J5JLZi3sgojN4fdYpNmnpd4s28g46RVjCY+qW15JU5CJO4C+E5z1rf4KqWFFw1iTZ2jUJpjpSLPtGUjMo7W1m/h8EkLD+vhvprN7B1z6Gg/SCalQh2RaPLq/7kuXCFvZIIKShCSw3dSoMOOulZ9Sf8xu0+CJd1TQ6Fdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=imag.fr; spf=pass smtp.mailfrom=imag.fr; dkim=pass (2048-bit key) header.d=imag.fr header.i=@imag.fr header.b=NIc6lULV; arc=none smtp.client-ip=152.77.200.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=imag.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imag.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=imag.fr; s=2022;
	t=1773101453; bh=K6KOjirwWu6hxLyRAT0WLc1dq0LGNWS7j6XYIxLCRp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NIc6lULVwjAeqp6WE0ElnY6ST1AgwRGFDZN3mHE63R7YP1YqhLRUx0bLLRm46Limv
	 zpB+Vivjr7sDT9k2lwjDVt8OqFXXyjTSQVwjMPm49GyQapxMYgYs+ZRN55yTswbPAc
	 KkufhVOXj/EGmukFqwx+3duBr9LXWy5Vu002kli7aDgQD9iuriXE21sYy2QW/gmR+P
	 sgAh1X8wAFswrU3bXR+ohxFn06z4pv26IKZXuS6xaidS/GP1Qd0NsUEpoZZKPBx8I9
	 VqPyEBe0nawTfCRfHIAWuUh29cHvlhL4bL+G8FiJBXpyK7iweA4/nQEzLnWnk40ZSn
	 2Vwg/3QOFoEjg==
Received: from mailhub-2.u-ga.fr (mailhub-2.u-ga.fr [129.88.178.102])
	by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D5E6B40277;
	Tue, 10 Mar 2026 01:10:53 +0100 (CET)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
	by mailhub-2.u-ga.fr (Postfix) with ESMTP id D20ACFF853;
	Tue, 10 Mar 2026 01:10:53 +0100 (CET)
Received: from [192.168.1.87] (unknown [87.89.124.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: palixn@univ-grenoble-alpes.fr)
	by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 5CBD8400E6;
	Tue, 10 Mar 2026 01:10:53 +0100 (CET)
Message-ID: <1c546ad7-14f8-4695-9754-32a020f8a082@imag.fr>
Date: Tue, 10 Mar 2026 01:10:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/dev-tools: fix a broken URL in
 dev-tools/coccinelle.rst
To: Haoyang Liu <tttturtleruss@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Julia Lawall <Julia.Lawall@inria.fr>, Shuah Khan <skhan@linuxfoundation.org>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260308100851.341-1-tttturtleruss@gmail.com>
 <87v7f5vv9x.fsf@trenco.lwn.net>
 <ae8dda71-9e25-4f3b-ab95-1b00809ade37@gmail.com>
Content-Language: en-US, fr
From: Nicolas Palix <nicolas.palix@imag.fr>
Organization: LIG
In-Reply-To: <ae8dda71-9e25-4f3b-ab95-1b00809ade37@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (palixn@univ-grenoble-alpes.fr) via submission-587 ACL (41)
X-Rspamd-Queue-Id: 1381B242F30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[imag.fr:s=2022];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[imag.fr:+];
	TAGGED_FROM(0.00)[bounces-78543-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[imag.fr];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lwn.net,inria.fr,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.palix@imag.fr,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi,

Maybe we can just throw away that section of "Supplemental 
documentation" and its link ?

Nowadays, there is much more SmPL provided, and the rst file
describes better and up-to-date information.

Would a link to
https://www.kernel.org/doc/html/latest/dev-tools/coccinelle.html
be useful to point to latest version ?

Sincerely,

Le 09/03/2026 à 17:28, Haoyang Liu a écrit :
> 
> On 3/10/2026 12:10 AM, Jonathan Corbet wrote:
>> LIU Haoyang <tttturtleruss@gmail.com> writes:
>>
>>> The original supplemental documentation for coccicheck is
>>> https://bottest.wiki.kernel.org/coccicheck, which redirects to a not 
>>> found page,
>>> thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
>>> which adds a suffix to original URL to make it direct to the right page.
>>>
>>> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
>>> ---
>>>   Documentation/dev-tools/coccinelle.rst | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/ 
>>> dev-tools/coccinelle.rst
>>> index 2b942e3c8049..f73ccf5397f3 100644
>>> --- a/Documentation/dev-tools/coccinelle.rst
>>> +++ b/Documentation/dev-tools/coccinelle.rst
>>> @@ -61,7 +61,7 @@ Supplemental documentation
>>>   For supplemental documentation refer to the wiki:
>>> -https://bottest.wiki.kernel.org/coccicheck
>>> +https://bottest.wiki.kernel.org/coccicheck.html
>>>   The wiki documentation always refers to the linux-next version of 
>>> the script.
>> I'll apply this - a working URL is better than a broken one.  But is
>> there really nothing better to link to than a page that warns "OBSOLETE
>> CONTENT" at the top?
> 
> Dear Jon,
> 
> Unfortunately, I do not find any other documents about this script, so I 
> have to use it even though it's obsolete.
> 
> Sincerely,
> Haoyang
> 
>>
>> Thanks,
>>
>> jon
> 
> 
> 
> 


