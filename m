Return-Path: <linux-doc+bounces-92679-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ExBXIADcMmr76AUAu9opvQ
	(envelope-from <linux-doc+bounces-92679-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 19:40:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE469BBEA
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 19:40:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ME3Wd1Bq;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92679-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92679-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC1C3300C7CA
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 17:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844BF40D597;
	Wed, 17 Jun 2026 17:40:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC633FE02
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 17:40:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781718010; cv=none; b=VazCKNvCj8kmJVtGWDALL8eFnjrLoMLQez/CL7T1sTm5O/LRY2wM55cYB2FWtYiCgGNigl3LfXdlBVnMyHrqLKPdrLNcibeVcxlv1AvXshg9uQhQf5+fKyZjTNv9oGUBmgsQSrxYU4PvSM+ZB/KUNo4cnIe8oVOaCnqp2/lYOqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781718010; c=relaxed/simple;
	bh=3H6Tx8GKVFXGcwT6woXKZw4U9eyeRFNU5j+1Z0MDS6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VdxK/YMxH2TuB6OK9jP9EIZ26L/UV0kULQsOez7x3CluZYOd7MjLas97xSSYwjCmbLC1tDMHKgchKR5gumVSy8K5aa32tZpBng54jMkCK3Ah32wVpfo0o9+ICaRcYPIkhpZjyhNK4uoGLN6rOq2VvQff1lp+t+T11u80Oa4FQZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ME3Wd1Bq; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so63570265e9.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781718007; x=1782322807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=E4aTYQpCEBfoHlNp/ih1aDYhCnw5Uq36PYKp2Wj/2Xk=;
        b=ME3Wd1BqunjbXx1jj5Nqrd4ZQ0HbyYsoc4LsCb+zo/c/DY4jbzO6IMvFSQRPn1XW4e
         0Rm+67aRIPdnLLaLgz7NbLkLKj5rdH46f8vV+PnvkM6lK+GCNg2cOk3Mmh9W/LY9syzO
         4LXczJCror55fEGYc2TEV1K33AbuuUv1TNchT2WHZe4RMQcSdb0zL5pOK5Zp2M5XAt6e
         bs/eX2UVglZKgI5FEfSaySKbWhfRHkg3TIk2G/grHGilUdo8Q7Eq48y5lPhY4Cl9KVby
         yVRXc5o1IV2ecGx+f0DpsHo8V27WjK9w1igw55HDhTLEBapvYxIl0xe15PzQTAl5hZ3k
         3hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781718007; x=1782322807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4aTYQpCEBfoHlNp/ih1aDYhCnw5Uq36PYKp2Wj/2Xk=;
        b=hwy4ZJQpcEEjpfr75uSVvSdQAwd4vTvVSElTJQcgj3SkTDFE42499+l3zrTfXGqG+k
         BGNeL38QI9P5lLNZ5tOOrfnwtZCj0v9I5RvDFxdcyB4quAUIL98hy7TuPsw3pf/8rELZ
         CGhtOMbtZP3fwjiCXWtGiOF+LW1x7O0SPP4eZIy6Un1alMY2tDjPW9mCKsTH15Bdd4GB
         KPTTFZe0NO5jQjJPQqIcEa2bQUyh/WwCh4vo/GJVwlqrXCl9jxrDU6CxaVTVkuc9DRoa
         cBglYQiwJNaNJEqNL9oZ0GnMekSxlGZN6DE/uYbBFUmyY36jCOakJRfUyimF2Jd/xNac
         wz0A==
X-Forwarded-Encrypted: i=1; AFNElJ8qPHlhzV0ih84za7yPl6BI3OCRMrY4CQniXY4+f8fVYfZnGry+DfyKKCm/EMEdVUV+bA+wxvU4w8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lNNmk1ZMquyHO3Jtlw4cusEsM/eabqmtus0Pn5CiLYdwLr7G
	IFYwdPMd3zfCZaeapg82mi3TwgvTm2DnNa1Vy0g0OWs9YxHWXD7WYUcT
X-Gm-Gg: Acq92OF5B4K4AvQ/HReoFxaBIpAiUgQJiI6bHVexHvdf8t2gVb/BF58C6hWXr0KI+oc
	yQPIOkGYAeJdrhLE6X6isHEhzNbz+3+7+gHivaaikVZvA7FDWZFRlPUJpp7QnOP+iDVRXGtgilG
	jjw7KNQg5gXMmCUCjpuXTYcUcl/amBmhGYULsd3mSovkrDZy3VbpoBOGCQJ68MzR7hQJuBji/rX
	vNe+TId38hLumZdnz5ZMRM6r4nHUOTTdiFCSp/W3VmY2K97xt8f5Azs+v+S/0cBVLBo5AfBpkma
	wLmRvVK75lTq5GUDLCQRNRUnOH2JF8qSA4xdlEkt9EEYlc/RPdJE3/1X9CB852CdwM1QnLlZZAI
	9v4O1ZCW2RoYCVw4vwrfp8lz3RmGGDw4bIKoGiOso5XBR09PtK4pU6QP/NsbGubsU0jKaBeysh+
	9+mo2Sk6sE3ozqkrATfoEyPffZ9/fN0qkxLYE/Ec64QOjP8Ei43T/8PCvLBh3RqQxiF6bcdzeTn
	jtO3xB7GZHCU14+ng==
X-Received: by 2002:a05:600c:3e1a:b0:490:e974:e01f with SMTP id 5b1f17b1804b1-492333ecb80mr88065235e9.28.1781718007311;
        Wed, 17 Jun 2026 10:40:07 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49234daafc7sm59819515e9.10.2026.06.17.10.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:40:06 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0f131ee4-d335-45d2-b6ae-49c18df1353b@gmail.com>
Date: Wed, 17 Jun 2026 18:40:05 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/10] RAS: add firmware-first CPER provider
To: Ahmed Tiba <ahmed.tiba@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
 Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <djbw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev, linux-cxl@vger.kernel.org,
 devicetree@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com
References: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-0-91f725174aa0@arm.com>
 <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-10-91f725174aa0@arm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-10-91f725174aa0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-92679-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ahmed.tiba@arm.com,m:rafael@kernel.org,m:tony.luck@intel.com,m:bp@alien8.de,m:guohanjun@huawei.com,m:mchehab@kernel.org,m:xueshuai@linux.alibaba.com,m:lenb@kernel.org,m:saket.dumbre@intel.com,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:ira.weiny@intel.com,m:djbw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:acpica-devel@lists.linux.dev,m:linux-cxl@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-edac@vger.kernel.org,m:linux-doc@vger.kernel.org,m:Dmitry.Lamerov@arm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DCE469BBEA

Hi again Ahmed,

On 6/17/26 14:54, Ahmed Tiba wrote:
> +config RAS_CPER_ESOURCE
> +	bool "Firmware-first CPER error source block provider"
> +	select GHES_CPER_HELPERS
> +	help
> +	  Enable support for firmware-first Common Platform Error Record
> +	  (CPER) error source block providers. The current in-tree user is
> +	  described by the arm,ras-cper DeviceTree binding. The driver
> +	  reuses the existing GHES CPER helpers so the error processing
> +	  matches the ACPI code paths, but it can be built even when ACPI is
> +	  disabled.

Yep, sure enough, this patch causes a build error when you enable
RAS_CPER_ESOURCE without enabling ACPI:

drivers/firmware/efi/cper-x86.c: In function ‘cper_print_proc_ia’:
drivers/firmware/efi/cper-x86.c:352:21: error: implicit declaration of
function ‘arch_apei_report_x86_error’ [-Wimplicit-function-declaration]
  352 |                     arch_apei_report_x86_error(ctx_info,
proc->lapic_id)) {
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~

- Julian Braha

