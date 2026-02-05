Return-Path: <linux-doc+bounces-75396-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIsrGGTkhGlf6QMAu9opvQ
	(envelope-from <linux-doc+bounces-75396-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 19:41:40 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1DF682C
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 19:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DD363009F80
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 18:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBF23033DC;
	Thu,  5 Feb 2026 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="cHqs/fpk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail39.out.titan.email (mail39.out.titan.email [209.209.25.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF0305E21
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.209.25.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770316881; cv=none; b=dH41gC0VNj8AyJx9SfatdkTywlGSiGBjFBVmhRy1tSLrN1D3qZy6DdP7JHlusw3K0tbo5kHo3/NQzd6OjgWeLJr1jZ7MtxUJ0P0JoPOXYDAAOM9CZft2hjeGeFFQHg0BWV1wFGJg98hH/5ReqtxZow5s5utNfMx8YCr+prmP5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770316881; c=relaxed/simple;
	bh=ZfA8PkAFdlwHrlgMLfk3+aMoMG3RKUERJ1HxM1B/+VQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ARs7QAjxZumy6fNRIUWoZ8mxYGV+76KdPsduvLEMLSV5GTZFd/2Wxq1Ru9gGZufXUDw23g29enc0kyKdd/l6fCIe1v9OE6GNUb+Hri6kAK0QSPhebRPwjoRVljp4+BW+Zr7VuYxtgj5fuONg+tGD8gP1D5JTX5O4iW6iYoREAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=cHqs/fpk; arc=none smtp.client-ip=209.209.25.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f6Qn01llBz7t9l;
	Thu,  5 Feb 2026 18:32:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=DN4f2HEBvDbl5vUvK2HOeo6rwR2EUlqz6bPOAMCA7cE=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=mime-version:from:to:in-reply-to:message-id:references:subject:date:cc:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1770316340; v=1;
	b=cHqs/fpk7jX1EyVQy4A9Ia7euCJVcKYyMYQqhnp9H1NPik6vemTpYKpSpMDffbQJU64Gww79
	ww3JcTWf/CIU0CnuJQjQIjuk6hLi0VraPPKan5B3L4II94O6UqdBC2b3qtBNGreYin414MLLoA8
	rdjinBlqH2jn2pm55F2t+q6M=
Received: from smtpclient.apple (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f6Qmx46YBz7tHq;
	Thu,  5 Feb 2026 18:32:17 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update kernel.org
 docs link
Feedback-ID: :amitabh@amidevlab.com:amidevlab.com:flockmailId
From: Amitabh <amitabh@amidevlab.com>
In-Reply-To: <87sebfgqdf.fsf@trenco.lwn.net>
Date: Fri, 6 Feb 2026 00:02:00 +0530
Cc: workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Amitabh <amitabh@amidevlab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3AB51D59-A054-4847-91CD-DFF3A2EB5F04@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <875x8bi6su.fsf@trenco.lwn.net>
 <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
 <87sebfgqdf.fsf@trenco.lwn.net>
To: Jonathan Corbet <corbet@lwn.net>,
 konstantin@linuxfoundation.org
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770316340041323123.6018.6051918048607993769@prod-use1-smtp-out1002.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=fsImZE4f c=1 sm=1 tr=0 ts=6984e234
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=IkcTkHD0fZMA:10 a=CEWIc4RMnpUA:10 a=07d9gI8wAAAA:8
	a=4yxl8aT0AAAA:8 a=unKpqin9n7vsr-xuANsA:9 a=QEXdDO2ut3YA:10
	a=e2CUPOnPG4QKp8I52DXD:22 a=oCAeEeOuyiZLRzIZmmpZ:22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amidevlab.com:s=titan1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-75396-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[amidevlab.com];
	DKIM_TRACE(0.00)[amidevlab.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitabh@amidevlab.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amidevlab.com:email,amidevlab.com:dkim,amidevlab.com:mid,lwn.net:email,checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B4F1DF682C
X-Rspamd-Action: no action

Hi Jon,


> On 5 Feb 2026, at 9:00=E2=80=AFPM, Jonathan Corbet <corbet@lwn.net> =
wrote:
>=20
> Amitabh <amitabh@amidevlab.com> writes:
>=20
>> Hi Jon,
>>=20
>>> On 5 Feb 2026, at 8:19=E2=80=AFPM, Jonathan Corbet <corbet@lwn.net> =
wrote:
>>>=20
>>> Amitabh Srivastava <amitabh@amidevlab.com> writes:
>>>=20
>>>> Update http link to the documentation about how to add a kernel.org =
UID to
>>>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>>>> checkpatch warning.
>>>>=20
>>>> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
>>>> ---
>>>> Documentation/process/maintainer-pgp-guide.rst | 4 +++-
>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/Documentation/process/maintainer-pgp-guide.rst =
b/Documentation/process/maintainer-pgp-guide.rst
>>>> index b6919bf606c3..1e4d885dc784 100644
>>>> --- a/Documentation/process/maintainer-pgp-guide.rst
>>>> +++ b/Documentation/process/maintainer-pgp-guide.rst
>>>> @@ -1,3 +1,5 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>=20
>>> Do you know that was the intended license for this file?  We need to =
be
>>> careful about putting license declarations on other people's work.
>>>=20
>> Yes, The Linux kernel documentation is typically licensed under =
GPL-2.0.
>=20
> I am aware of kernel documentation practices :)  "Typically licensed"
> does not tell you what any individual contributor intended, though.
> *Probably* that tag is OK, but you should really consult with the
> original author of that page to ask what their intent was.

You are absolutely correct. In fact, the original author, Konstantin =
Ryabitsev,
(in TO here) responded to my v1 patch in the affirmative regarding the =
changes.
=
(https://lore.kernel.org/all/177006480695.901069.1641199463436529014@lemur=
/)

>=20
>> Other files in the directory contain the same =
'SPDX-License-Identifier' as well.
>> However, I have added this just to satisfy checkpatch.pl requirement, =
which
>> checks for missing license information in documentation files. Let me =
know if
>> you think otherwise.
>=20
> Checkpatch makes suggestions, not requirements.  All files in the =
kernel
> should have SPDX lines, but they need to be the correct ones, not just
> somebody's guess.
>=20
I went with the common practice, but, can wait for konstantin to endorse =
this.

> Thanks,
>=20
> jon

Regards
Amitabh


