Return-Path: <linux-doc+bounces-75361-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGYvA5u3hGnG4wMAu9opvQ
	(envelope-from <linux-doc+bounces-75361-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 16:30:35 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697BF4A16
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 16:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51B3E3022F5A
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 15:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F068423158;
	Thu,  5 Feb 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jT9lmIiS"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090AF423156;
	Thu,  5 Feb 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770305406; cv=none; b=NAjz5WIUz135DwKN+RLE+qo2OnzzL5tOnba7JbCNVzg9f/t1yIZHg0GS/CT5JFuwzGs8DUeveQEKKXOVfEJ5jJWQ3XlcacCYPXIxywC+qZLr5b5MFSK7DnP0Uqm9UWA1hwSj0GwE1RTr2DZid+mAcdHNc+ValUFw7mkHwU1QgKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770305406; c=relaxed/simple;
	bh=fZ2xlxnXLiw/h5Vlzzv1Q/V+SjQSkj17RTsLJRoAuU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uHbZJ3fMpyAfAZQS08s6wujQ3aALhv6HgIaud+lKPJ2y9LFTK1rys0noPl4LgjPPgzGHoZZ1dsCarACJx5rSpssFfzJwYv8rPi7fZcDq+u6MGYPCQDxmLuQd48IbCCQ6D+4Y5xbesyr8G7QcZXldAVSPQYJjbIJfm28LH+7x890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jT9lmIiS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2D2F940423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770305405; bh=wn/A4B0zgT1iPFcsMuZLEzI5PhZCTF66+607UcUmVvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jT9lmIiScm/1YC82RwKYOP9RvOi7plkZyz51r617RrgrPNgDFRFLAYTJ70c93G7Rf
	 11B5dLbg+P8zi/t4dCo8maI+AV6fA0c3210dmzkDSNTUqmNEHIJVegjINAaR4VA0Mp
	 t+dLgdoqS3hdsvqQZiNVAFMIGgpqWjM0PCiNjWWBepp/8E/Lg+POlDrMJh9oKGg9rj
	 zTXQ/wtQZ43sZaPHNX3AL+lAG3BQuvJHFvcWABMXsm82aKkgHBzGqFh3HoIxysPtAq
	 p+i34MvvZ5EHvV5HwkhRJBEQiS3GoY1464n2+MwW1MiS3hNOhw18NX9k7JlEuKaRKF
	 +rWQxSh+CXv6g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2D2F940423;
	Thu,  5 Feb 2026 15:30:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amitabh <amitabh@amidevlab.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update
 kernel.org docs link
In-Reply-To: <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <875x8bi6su.fsf@trenco.lwn.net>
 <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
Date: Thu, 05 Feb 2026 08:30:04 -0700
Message-ID: <87sebfgqdf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75361-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amidevlab.com:email,checkpatch.pl:url,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 7697BF4A16
X-Rspamd-Action: no action

Amitabh <amitabh@amidevlab.com> writes:

> Hi Jon,
>
>> On 5 Feb 2026, at 8:19=E2=80=AFPM, Jonathan Corbet <corbet@lwn.net> wrot=
e:
>>=20
>> Amitabh Srivastava <amitabh@amidevlab.com> writes:
>>=20
>>> Update http link to the documentation about how to add a kernel.org UID=
 to
>>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>>> checkpatch warning.
>>>=20
>>> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
>>> ---
>>> Documentation/process/maintainer-pgp-guide.rst | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documenta=
tion/process/maintainer-pgp-guide.rst
>>> index b6919bf606c3..1e4d885dc784 100644
>>> --- a/Documentation/process/maintainer-pgp-guide.rst
>>> +++ b/Documentation/process/maintainer-pgp-guide.rst
>>> @@ -1,3 +1,5 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>=20
>> Do you know that was the intended license for this file?  We need to be
>> careful about putting license declarations on other people's work.
>>=20
> Yes, The Linux kernel documentation is typically licensed under GPL-2.0.

I am aware of kernel documentation practices :)  "Typically licensed"
does not tell you what any individual contributor intended, though.
*Probably* that tag is OK, but you should really consult with the
original author of that page to ask what their intent was.

> Other files in the directory contain the same 'SPDX-License-Identifier' a=
s well.
> However, I have added this just to satisfy checkpatch.pl requirement, whi=
ch
> checks for missing license information in documentation files. Let me kno=
w if
> you think otherwise.

Checkpatch makes suggestions, not requirements.  All files in the kernel
should have SPDX lines, but they need to be the correct ones, not just
somebody's guess.

Thanks,

jon

