Return-Path: <linux-doc+bounces-91562-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4CZ7JcjnJ2rU4QIAu9opvQ
	(envelope-from <linux-doc+bounces-91562-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 12:15:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 074DA65EC81
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 12:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=bdqaCboN;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91562-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91562-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6604C308E09C
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 10:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0B33EFFC9;
	Tue,  9 Jun 2026 10:07:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6E33EFFDE
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 10:07:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999634; cv=none; b=s5y2LXBCBEuPj/8GDkvsgIFlshb4wA6fvHWLHekJMoF0Gd8DqhSXT4RKFTERlCQME+pnQuT8RKs1gYQDeUiMVz3FpOVP73jTlvoXbyI6Gjb6/is8dOCZNht80PueSOOMb2MCFDCXq4cOoS4m0gulvVJqg8cMbsUpTxJ8Qf5iQ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999634; c=relaxed/simple;
	bh=4C8PgQ9FE9L7n6/Z7yWqH9fic/Jpg5Q4xG+oktm/EO8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=AxYaFfG8iNRDSJBQV4MPiZkGJOA4l1WxDkqEQoEHNho8hDqxHxTtafu+H68Weus4VR9Ey39pzaIel6JSspiBVH9a7hz59osPVz4QOb9RzvQktN7metNBqeW4qmB4/vJQPlyJVFuR60O+AWIaUbNL58hk3zbrZ85YSKtw1rcrNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=bdqaCboN; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso43765645e9.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780999629; x=1781604429; darn=vger.kernel.org;
        h=in-reply-to:references:mime-version:content-transfer-encoding:to
         :from:subject:cc:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24+9tIBKRIB6Fi/lgC4G5fEyDREBkP8hCdRX4h9xXVU=;
        b=bdqaCboNeSqvPSJGLJTAX4qvk+8Zu3IV9qBSjIMyPqe9aFdw4uQaAFm5TIOks6fBZa
         8eIn2+dwlfAshEneN4LYMBxNuzUBiFc7lc3/gJck4ldnCZlXZhrP7OvZbDWwZaj0MCDU
         C1xGRAGUWMQSULQ+UYoi/IdFRYhygaihCu858NsvtAiyCzJKSmavJU7fz3n9d3k8DVMQ
         97YXLvisbgucwWtTxc1FfXJWhHQFZiiFG0twHyWsyGsLO0JAwGWppEyT39Q8/kXXNRcz
         9e/0Hc6WzKJmVCrOu+RgCRX1VbUwKCpnuCwF0XYKlAcftM3S7jyGhHCAuNYO/oyatI54
         l5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999629; x=1781604429;
        h=in-reply-to:references:mime-version:content-transfer-encoding:to
         :from:subject:cc:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=24+9tIBKRIB6Fi/lgC4G5fEyDREBkP8hCdRX4h9xXVU=;
        b=ILpKP3/fhSKRSkTOePhk2BiuMA/niqZ/cCHiD386IF0AKGHQJjLDZ3Q6wTaXSzwd4S
         BrKvPWX91aD7I9/CDJ+Y8fh38rIMHOE10lLFBkjRV6dZ0bcpieYWe3KlL0jEg0VL2oGj
         d+zN4T1gOlFzEWOkfJJLL22dFbljMr3g090k9ZGPg9DcqIyyho0agPodoySdBMSrUKeb
         tHPlSJbt+9dIfq12NARlfB4L1J12O+Vq+W0aV/uG3O3MHd8BpmHPmSfO76p6mBWVBQt4
         eBvcp4WnoY2dbwgYzKNLp2OyQ3adVAOMbxIdktg56hbR/tQgOohIbTqKAbkf9pB0VSP9
         N79Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Y0PlgE2wP3Hzv+C3+SYyuSQ+A6AB5z3VS02QQ6630fhWMVDD0gxjXQWeiggz2SdXfX0aSrXOPBGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJBUF0/lV+9/gePhMuJB3ipAM8duni20ANcWLzAfW7t999c2xC
	M4fchZ7eXaR3+as3SvJHzDUlhOdkuUHiMnhQptTgaEtrGfvLGWAkJdYvOepedxRGfg==
X-Gm-Gg: Acq92OHddnKshbrvD4I3r+wW1G7bvG4fcaVVTx72lyuNExqqrEDdDnLSGc/Xzj6o6Ha
	LDfxta0qLgoFtIugX5/sJ+qJm331SPzBuM6por15zChUkDYyuM6FXT/KMEiq+RvnVZUTYmZhPEs
	/evtCrHR1IXdzlqclkBZOSrVKIBf9Aq+IZMK2gYYtBuTT5ytUbGQO1046E0B2eWShhDDBaAuAQl
	M74ZaM0Ubj4riLDNn2SEuUWlqh1U072LlD+UXB3YVVduoxf+PCAOOhejzMHozoKtN5ou31X2qjZ
	9eJ8nL7u0jKgODwjkU5P7kW1hp+8NY/6+kUQWw6g6XnksnGtTLx+mk8yMcefCj1DUhpOQkhYWHt
	UOaZmxqknZCKYbXXgiWxO5R7Wy4a5i7ww+tFdcNsaFElabKkSrb17BCphNeS53oIX3cjPo/TOpN
	GTTOqByJbLnCCM/xuQ26ogmAjYS3GQtNRS9f3dQUI=
X-Received: by 2002:a05:600d:8444:20b0:490:48b7:c1ff with SMTP id 5b1f17b1804b1-490d72239damr17568855e9.17.1780999629113;
        Tue, 09 Jun 2026 03:07:09 -0700 (PDT)
Received: from localhost ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm49395986f8f.7.2026.06.09.03.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:07:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 12:07:07 +0200
Message-Id: <DJ4FODTOAKGE.IWG0EYLWZEK4@9elements.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Luis Chamberlain" <mcgrof@kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez" <da.gomez@kernel.org>, "Aaron
 Tomlin" <atomlin@atomlin.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: Re: [PATCH 1/2] module: add CONFIG_MODULE_RESTRICT_AUTOLOAD
From: "Michal Gorlas" <michal.gorlas@9elements.com>
To: "Sami Tolvanen" <samitolvanen@google.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
References: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
 <20260515-autoload_restrict-v1-1-40b7c03ddd04@9elements.com>
 <20260605182517.GA2939956@google.com>
In-Reply-To: <20260605182517.GA2939956@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91562-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.gorlas@9elements.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-modules@vger.kernel.org,m:samitolvanen@google.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.gorlas@9elements.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 074DA65EC81

On Fri Jun 5, 2026 at 8:25 PM CEST, Sami Tolvanen wrote:
> On Fri, May 15, 2026 at 07:20:19PM +0200, Michal Gorlas wrote:
>> Add CONFIG_MODULE_RESTRICT_AUTOLOAD and modrestrict parameter
>> documentation.
>>=20
>> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt |  5 +++++
>>  kernel/module/Kconfig                           | 15 +++++++++++++++
>>  2 files changed, 20 insertions(+)
>>=20
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
>> index 03a550630644..1013104f0943 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -4185,6 +4185,11 @@ Kernel parameters
>>  			For details see:
>>  			Documentation/admin-guide/hw-vuln/processor_mmio_stale_data.rst
>> =20
>> +	modrestrict=3D<bool>
>> +			Control the restriction of module auto-loading to
>> +			CAP_SYS_ADMIN. If no <bool> value is specified, this
>> +			is set to the value of CONFIG_MODULE_RESTRICT_AUTOLOAD.
>
> Doesn't this default to true if no bool value is specified? It only uses
> the config if modrestrict is not passed to the kernel at all.

Right. Will adjust the description here.

>
>>  	<module>.async_probe[=3D<bool>] [KNL]
>>  			If no <bool> value is specified or if the value
>>  			specified is not a valid <bool>, enable asynchronous
>> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
>> index 43b1bb01fd27..c9e01bb848c0 100644
>> --- a/kernel/module/Kconfig
>> +++ b/kernel/module/Kconfig
>> @@ -337,6 +337,21 @@ config MODULE_SIG_HASH
>> =20
>>  endif # MODULE_SIG || IMA_APPRAISE_MODSIG
>> =20
>> +config MODULE_RESTRICT_AUTOLOAD
>> +	bool "Restrict module auto-loading to privileged users"
>> +	default n
>
> You don't need to specify default n here.
>
> Also, I think you can just squash the two patches. There's no benefit
> in splitting the config/documentation into a separate patch.

Alright, will squash them in v2.

Best,
Michal


