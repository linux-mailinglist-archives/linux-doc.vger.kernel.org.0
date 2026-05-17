Return-Path: <linux-doc+bounces-88072-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG6AKmE+CmpWyAQAu9opvQ
	(envelope-from <linux-doc+bounces-88072-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 00:17:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 94684564267
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 00:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD1C53001580
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 22:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BD03D410B;
	Sun, 17 May 2026 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="YX3m+FXZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster3-host9-snip4-6.eps.apple.com [57.103.77.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F72F7F19
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 22:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779056219; cv=none; b=g8xZLqYsiuQDgYNKqdTY5R/zDQWaU1PYrXVNMb4RyFdLLRlCNdiELQJaJtQGkVqInGkBOh1zyLF1tZDX1u/iaJmowyvsGOMUPAAWKWZKHs1pX3Rtkn7Hmp7Zv5BZl/MHm71v5bGULJ2N+rKtjhzlhCNr9ri/dSFRSuV8HQ7ZqCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779056219; c=relaxed/simple;
	bh=/jvnP5BEgPIVvnD0g6bgpGqeZMd7YIi6EJcNGgJAKmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQR66ketIfF1zDLltFQlJVGdnkLgreoAaERiqLlFfw/Zz/WmqrY5GfOWEE7Laa2SKJdRXlLlMHS/oUIrB8ns4jHuvAbNM+Yy0kDbqlXmIj5aG1+n0QB+IqFT3IGjMNvMi7zlhFFVhpt4w3lrpuqvcj2BShtzAnlXvlSZ7smTNxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=YX3m+FXZ; arc=none smtp.client-ip=57.103.77.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-0 (Postfix) with ESMTPS id B8C431801BDB;
	Sun, 17 May 2026 22:16:54 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEG1sIUhhXE1gTVl8OXQIwUBtfAkIPHBNWFRMLU1ZRGFwdQAhUClkVC0EFXXcCURxWDVdDVARfUEsbDlsXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BeCF4fTBwdDlgGEh1QHA5RDlsCFgBKAlUaUgcWW1UHCQJcHxELGgBAAA8BFQ4aV1sGD1cVeRFQAVgeVl5aF15TFx9LAFxFWg5bBEcU
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1779056217; x=1781648217; bh=ulCzw2NgUu2BUgWlvH3hNeQX1YXWt94X8MJSULohJC4=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=YX3m+FXZ817fqgAuD7Z5IIcE2zYf2plqg5/r+5yBgfbZCAB7Akm6xOuuhkPqVbaNqH/KKDGrA0GmKGLbAH9zg0m8q0GPwAzx+9Iz8Xs1sMbEerYJbZGifZeUEN37ht280TS7mKiIrOwmLK3OWkOgmermQdZqGBGBwwIl4AdOqJbRV3q5jwe9twiBAganJXeX0K7dMMKBdxafhcOqmCR+WFEv9ijmCYQJaeagA2bLsDEjKqAsVj8E/BdPeYI+5NWHRb2SW/lQaITmzDG4lAay4JrYKpisNZAecEsZmsCj9rolMeiLgr0PfYJcfqCf1mEOLdEWxIGK4VmOayJcSmN1mQ==
Received: from [192.168.1.34] (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-0 (Postfix) with ESMTPSA id 61C131800C0F;
	Sun, 17 May 2026 22:16:52 +0000 (UTC)
Message-ID: <900f9218-95fb-4d57-a2b3-7d3e7bd61dee@icloud.com>
Date: Mon, 18 May 2026 07:16:48 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix typo in uniwill-laptop.rst
To: Armin Wolf <W_Armin@gmx.de>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260516070650.9454-1-cheesecake2960@icloud.com>
 <d693ffc6-08f0-44ad-a274-c25efc3fcfb2@gmx.de>
Content-Language: en-US
From: Cheesecake <cheesecake2960@icloud.com>
In-Reply-To: <d693ffc6-08f0-44ad-a274-c25efc3fcfb2@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDI0MiBTYWx0ZWRfX/rh9Fn3abkri
 YsPejqtXoj3JoEAHFEwbxgcHu5wlKzMG2snGf2hmV7MBOmFYATZ4j4DZTuE9k3e9Nhaf5f7nf3U
 nivQm7bYsL8MVj9QkzltfSRmwxiQyC4D0oieEMAFOCTcuIaE632Of8mgORVq2g1+aGXfZsKjYM1
 /pmmjClmO0EKVymDj7SqjpPGB1YGuzOKwqeMvJ0h1VFxOzkQzpElvR1nIX9t/rGfmUmDKEvc3OC
 cytuI5KJpM4WoIITeBNWL9PgXm2WxkwxrWuU6M58hj2USW5fUb6jIb9X7jYRIqUaIgogl71ZJQk
 bVUHJqM40bNUv2gU1RhsGPUDGIIx/VQqshJT50p0CRQfBOHkYqmVpaQO6xZyQU=
X-Authority-Info-Out: v=2.4 cv=IfmKmGqa c=1 sm=1 tr=0 ts=6a0a3e57
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=sIGCgqHK338A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=v3ZZPjhaAAAA:8 a=Ass7DQ-I9p7-9zMoZ8AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-ORIG-GUID: 19vxy5Lj4Lk_VDVTE7hB0S82MlYSIk2c
X-Proofpoint-GUID: 19vxy5Lj4Lk_VDVTE7hB0S82MlYSIk2c
X-Rspamd-Queue-Id: 94684564267
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88072-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmx.de,lwn.net];
	FREEMAIL_FROM(0.00)[icloud.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[icloud.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cheesecake2960@icloud.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icloud.com:email,icloud.com:mid,icloud.com:dkim,gmx.de:email]
X-Rspamd-Action: no action

On 2026/05/18 1:01, Armin Wolf wrote:

> Am 16.05.26 um 09:06 schrieb Cheesecake:
>
>> Replace "benifit" with "benefit".
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
>> Signed-off-by: Cheesecake <cheesecake2960@icloud.com>
>> ---
>>   Documentation/wmi/devices/uniwill-laptop.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst 
>> b/Documentation/wmi/devices/uniwill-laptop.rst
>> index e246bf293..65583b239 100644
>> --- a/Documentation/wmi/devices/uniwill-laptop.rst
>> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
>> @@ -189,7 +189,7 @@ Indexed IO
>>     Indexed IO with IO ports with a granularity of a single byte can 
>> be performed using the ``RIOP``
>>   (read) and ``WIOP`` (write) ACPI control methods. Those ACPI 
>> methods are unused because they
>> -provide no benifit when compared to the native IO port access 
>> functions provided by the kernel.
>> +provide no benefit when compared to the native IO port access 
>> functions provided by the kernel.
>>     Special thanks go to github user `pobrn` which developed the
>>   `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on 
>> which this driver is partly based.

Hello,

I accidentally used my nickname.

I'll resend this patch with a proper signoff.


Thank you for your time.


