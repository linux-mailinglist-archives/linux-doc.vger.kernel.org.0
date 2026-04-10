Return-Path: <linux-doc+bounces-83005-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJkeGqLz2GlJkAgAu9opvQ
	(envelope-from <linux-doc+bounces-83005-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 14:57:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D82DD3D7C3E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 14:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96E4E30156C5
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF8A1D0DEE;
	Fri, 10 Apr 2026 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="h8hpU+7r"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733F52139C9;
	Fri, 10 Apr 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825405; cv=none; b=eqSbaS5AGv6v9szmJ08apLuhc+xH9ZOBgBrsA7v+pUDoc3K846JjiyQre+L3WmkRwp87QAZ15GhikjjFlS1cZH+9FDWz6SPxKHYrswgfZTtu+t+kV1Qi1bX2zzN5gJBVpkxdrIRkc6VRezzzxxxTlZdO9qIOktRmgCUfs8NDgy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825405; c=relaxed/simple;
	bh=6h/7ocMklYwfb3bEyT/OvLS0gLchN5RHjoN2YbquAi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=REFBsQrYGGwqGtOFS/k142bQ4JARUVYstq/qMJfaJK/eInji5s9NocjzCTowfN/O/4uAiKymQaQ3Etmhn8iOYbYCz5CevjSsVDWIRR3hFgu4pC4Wzpohc/aiR+tmUl1HJ56zUdkmPBFct850i7xgHiHbnYARDGD3ck6eneqeGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=h8hpU+7r; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A9316410A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775825403; bh=OFaRFy2DugIx4wmSFyS8VutuIIx/m4gk/BWAcWUJUg8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h8hpU+7rG9l3Zj9Pt6ghUXI1KpKDW4DbiHz3sSDtLjDroa0wjTXIy4CZKzZUdI0GV
	 dWaqk4QJLfTPe4aPBxSskobN6oGZpUAMedAuACT+nreILh6tyhWl/8+c4W+/K3PrEN
	 MJD7OFVr9+oMKsHHNJQGq54vrhukKEIm2gZGlE/ZHjEkBMJciHpKZf2d8PZbCtHKkY
	 JOWnEnPR/e8/ZbNS3cI3WDOLJApzz9vzWYjZbVKTUqLaui4lSWjUbMMRp4Myw5uh4r
	 6SzzYu3Xp2rNZ8014eZex/FBiTKp8syYLe1auGfGMM+1xChjGj4NF0Ix/eRmGGEh/G
	 ryYdUOihvJNvw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A9316410A1;
	Fri, 10 Apr 2026 12:50:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Matteo Croce
 <technoboy85@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Matteo Croce
 <teknoraver@meta.com>
Subject: Re: [PATCH] docs: escape ** glob pattern in MAINTAINERS descriptions
In-Reply-To: <72487cc4-b5fa-4a07-bcb5-a6ba479161e3@infradead.org>
References: <20260409223135.10186-1-technoboy85@gmail.com>
 <72487cc4-b5fa-4a07-bcb5-a6ba479161e3@infradead.org>
Date: Fri, 10 Apr 2026 06:50:02 -0600
Message-ID: <87o6jr2d51.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83005-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[infradead.org,gmail.com,kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D82DD3D7C3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi,
>
> On 4/9/26 3:31 PM, Matteo Croce wrote:
>> From: Matteo Croce <teknoraver@meta.com>
>> 
>> Escape '**' in the MAINTAINERS descriptions section to prevent
>> reStructuredText from interpreting it as bold/strong inline markup,
>> which causes a warning when running 'make htmldocs'.
>> 
>> Fixes: 420849332f9f ("get_maintainer: add ** glob pattern support")
>> Signed-off-by: Matteo Croce <teknoraver@meta.com>
>> ---
>>  Documentation/sphinx/maintainers_include.py | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
>> index 519ad18685b2..54f34f47c9ee 100755
>> --- a/Documentation/sphinx/maintainers_include.py
>> +++ b/Documentation/sphinx/maintainers_include.py
>> @@ -89,7 +89,8 @@ class MaintainersInclude(Include):
>>              output = None
>>              if descriptions:
>>                  # Escape the escapes in preformatted text.
>> -                output = "| %s" % (line.replace("\\", "\\\\"))
>> +                output = "| %s" % (line.replace("\\", "\\\\")
>> +                                        .replace("**", "\\**"))
>>                  # Look for and record field letter to field name mappings:
>>                  #   R: Designated *reviewer*: FullName <address@domain>
>>                  m = re.search(r"\s(\S):\s", line)
>
> It's nice to eliminate one warning from 'make htmldocs', so this is good
> in that regard. However, there are still multiple problems (not Warnings)
> with '*' characters in the MAINTAINERS file:

I've mentioned this before but done nothing about it ... I really wonder
about the value of bringing in the MAINTAINERS file in the first place.
Do we think that anybody is reading it in the rendered docs?

jon

