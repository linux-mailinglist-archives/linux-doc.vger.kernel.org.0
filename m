Return-Path: <linux-doc+bounces-75359-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGx5Jz21hGk54wMAu9opvQ
	(envelope-from <linux-doc+bounces-75359-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 16:20:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246DF4886
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 16:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A69313081883
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 15:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DF8421EEC;
	Thu,  5 Feb 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="FNZEwJrT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail82.out.titan.email (mail82.out.titan.email [3.216.99.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED913421EE2
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.216.99.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304572; cv=none; b=MWFX2XSwBCPc/VvsiFbtpGFGlSRrZPNZp7CXEc8TwaGIfo7tkt9FgcDZcGa00gbtHFLMZilvYh5FRJBWGhhcHTDhkOOxtAtcydpWfNhXvPRMOIZ7X936Xw13kJsVDWlZOnQWf56Czcu+pvZ9CdQpSbLtEOM/TaENTfO3P2gacmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304572; c=relaxed/simple;
	bh=Em0IBnAOKvbdhP2ZXM2M6eN7Om6BVNz94TgdbHVkrS8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jdsPEMtL7JDqfENLYkUmAs4MnUB2VWXhP2OpzFWxnldWOd1N5A/3aQHN9XzrI8e0nl/rCMrSxMBqb5A2KQ2AKhxprUzztx2trqVLrmCRaOTSqRiIj089tg7kndgGQrwd4XOIHt3fjMHR0fNYqCxB+oing7LyOYf3raVo7UpODFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=FNZEwJrT; arc=none smtp.client-ip=3.216.99.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f6LQf24KQz2xHM;
	Thu,  5 Feb 2026 15:16:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=EaTGnSttgAmRUuLl3/CSvDufPhbXTdqsDt2/0s/ZsR8=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=mime-version:in-reply-to:cc:message-id:to:from:subject:date:references:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1770304570; v=1;
	b=FNZEwJrTmG7L1jfaaO8PenrDhXSeHZPHMYdZ0/tlyu/Ypx14Q1RO0kAcs8P6pqugfzZM+JMe
	9AzQ5WlH/Adf8LDL+s+Z1+/bp5td2qiWAvLv25O1Fzi6zpG7XEc0zb+g9fOQIwdX8O+u7nd1Yw6
	VIYnM8gxLKGbWtFN38R+Blrc=
Received: from smtpclient.apple (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f6LQc418vz2xDp;
	Thu,  5 Feb 2026 15:16:08 +0000 (UTC)
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
In-Reply-To: <875x8bi6su.fsf@trenco.lwn.net>
Date: Thu, 5 Feb 2026 20:45:52 +0530
Cc: workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <875x8bi6su.fsf@trenco.lwn.net>
To: Jonathan Corbet <corbet@lwn.net>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770304570131689093.28339.5113251852896558738@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=FPHhx/os c=1 sm=1 tr=0 ts=6984b43a
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=IkcTkHD0fZMA:10 a=CEWIc4RMnpUA:10 a=07d9gI8wAAAA:8
	a=4yxl8aT0AAAA:8 a=np37udmmvbIGcRCE1RQA:9 a=QEXdDO2ut3YA:10
	a=e2CUPOnPG4QKp8I52DXD:22 a=oCAeEeOuyiZLRzIZmmpZ:22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[amidevlab.com:s=titan1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-75359-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amidevlab.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[amidevlab.com];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitabh@amidevlab.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0246DF4886
X-Rspamd-Action: no action

Hi Jon,

> On 5 Feb 2026, at 8:19=E2=80=AFPM, Jonathan Corbet <corbet@lwn.net> =
wrote:
>=20
> Amitabh Srivastava <amitabh@amidevlab.com> writes:
>=20
>> Update http link to the documentation about how to add a kernel.org =
UID to
>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>> checkpatch warning.
>>=20
>> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
>> ---
>> Documentation/process/maintainer-pgp-guide.rst | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/Documentation/process/maintainer-pgp-guide.rst =
b/Documentation/process/maintainer-pgp-guide.rst
>> index b6919bf606c3..1e4d885dc784 100644
>> --- a/Documentation/process/maintainer-pgp-guide.rst
>> +++ b/Documentation/process/maintainer-pgp-guide.rst
>> @@ -1,3 +1,5 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>=20
> Do you know that was the intended license for this file?  We need to =
be
> careful about putting license declarations on other people's work.
>=20
Yes, The Linux kernel documentation is typically licensed under GPL-2.0.
Other files in the directory contain the same 'SPDX-License-Identifier' =
as well.
However, I have added this just to satisfy checkpatch.pl requirement, =
which
checks for missing license information in documentation files. Let me =
know if
you think otherwise.

> Thanks,
>=20
> jon


