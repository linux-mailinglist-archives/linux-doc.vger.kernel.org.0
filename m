Return-Path: <linux-doc+bounces-2672-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC827F10C2
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 11:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 149CCB21744
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 10:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D968C6FD1;
	Mon, 20 Nov 2023 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XQ58ML01"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4495AC5
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 02:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700477284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fmHCyTLsVBo0Kc83TqxxdVsk2B46TkdS7UkGLyTjj8=;
	b=XQ58ML01UX5qi91CnrI/IHjoNDPUU0mERtRPzD0lgNZXBLnHSqO+xruvSbPYIEdq6hPcAX
	F6VTRS/QG1Dc7O3fgBTQW+QBKbghCwp+Cb359566YwfjM08l/wLb5ylaY/f87lWbr+kmbn
	fJoQtbtv9OeCSGbYk2D0CV9eFnUr8ZQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-CeQwOFyeMl2aVdHItCuthA-1; Mon, 20 Nov 2023 05:48:01 -0500
X-MC-Unique: CeQwOFyeMl2aVdHItCuthA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-54816f3f424so2827492a12.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 02:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700477280; x=1701082080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fmHCyTLsVBo0Kc83TqxxdVsk2B46TkdS7UkGLyTjj8=;
        b=cM1H/BoACPCeSx/QCLimR2QiZpwkB33OcVTy2YWfD47mTVRRWnF725wz+y8T1mGy1v
         sbzgwuHO0/ZUDE9QzSVgako6FMIQDo13aFwlFCi5XrVJgJXAnKnfosr8GLWMwnuOQeZ2
         lzrXCZ0YUR1YqR6wZy1aW6rybDIJpYmaLT3Qhtg1+7hIVXsSahfnK2BP/MxLZDQB0QzI
         t8NplZ4rUtD8DAp4jsbrsR9VZ0LX00iLVcgL2soMMPFs0HSYNrILMbxeb1u1qbbhowm6
         XH01Rnj9cQQzC+pD6tAjmBxHvhLXeLNAaVjNeuVbILon6km/lqUvIDbQmwrCDonZBBQ+
         MxRg==
X-Gm-Message-State: AOJu0YxJ3lD9MZ1F1aPfLJXmbrAr6Dk+Oks9/lsO/whD6JzOlVZKNcNp
	5pwbzCnRqEx4QcDnw5OuyVSfisesLMvu4gQ55Jntw8R7NopuxDlVMW97tOPgyGTegNUwrk+/PsM
	fjnJ63bKoSX+5PmTxie6T
X-Received: by 2002:aa7:c702:0:b0:548:b824:1cb8 with SMTP id i2-20020aa7c702000000b00548b8241cb8mr1156620edq.38.1700477280747;
        Mon, 20 Nov 2023 02:48:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOKYlrVDNsMyV/4F65dLvuDm38zuCaU8IqDF/1O3DU8ss3iUrOKIxHJ5ajO+kL3lmaO+RtpQ==
X-Received: by 2002:aa7:c702:0:b0:548:b824:1cb8 with SMTP id i2-20020aa7c702000000b00548b8241cb8mr1156590edq.38.1700477280434;
        Mon, 20 Nov 2023 02:48:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u24-20020aa7d998000000b00548b55f5ffdsm1059461eds.16.2023.11.20.02.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 02:47:59 -0800 (PST)
Message-ID: <e74b7896-2915-47bf-803e-25897cbb8eed@redhat.com>
Date: Mon, 20 Nov 2023 11:47:58 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/9] platform/x86/amd: Add support for AMD ACPI based
 Wifi band RFI mitigation feature
Content-Language: en-US, nl
To: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org, lenb@kernel.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, alexander.deucher@amd.com,
 Lijo.Lazar@amd.com, mario.limonciello@amd.com
Cc: majun@amd.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Evan Quan <quanliangl@hotmail.com>
References: <20231017025358.1773598-1-Jun.Ma2@amd.com>
 <20231017025358.1773598-3-Jun.Ma2@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231017025358.1773598-3-Jun.Ma2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/17/23 04:53, Ma Jun wrote:
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
> 
> To mitigate this, AMD has introduced a mechanism that devices can use to
> notify active use of particular frequencies so that other devices can make
> relative internal adjustments as necessary to avoid this resonance.
> 
> Co-Developed-by: Evan Quan <quanliangl@hotmail.com>
> Signed-off-by: Evan Quan <quanliangl@hotmail.com>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>

<snip>

> +bool acpi_amd_wbrf_supported_producer(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +
> +	if (!adev)
> +		return false;
> +
> +	if (!acpi_amd_wbrf_supported_system())
> +		return false;
> +
> +
> +	return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +			      WBRF_REVISION,
> +			      BIT(WBRF_RECORD));
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_supported_producer);

So until here you use acpi_dsm methods (1), which matches
with patch 1/9 which says that both producers and consumers
use a _DSM for WBRF.

1) With the exception of the weird acpi_amd_wbrf_supported_system()
helper.

> +static union acpi_object *
> +acpi_evaluate_wbrf(acpi_handle handle, u64 rev, u64 func)
> +{
> +	acpi_status ret;
> +	struct acpi_buffer buf = {ACPI_ALLOCATE_BUFFER, NULL};
> +	union acpi_object params[4];
> +	struct acpi_object_list input = {
> +		.count = 4,
> +		.pointer = params,
> +	};
> +
> +	params[0].type = ACPI_TYPE_INTEGER;
> +	params[0].integer.value = rev;
> +	params[1].type = ACPI_TYPE_INTEGER;
> +	params[1].integer.value = func;
> +	params[2].type = ACPI_TYPE_PACKAGE;
> +	params[2].package.count = 0;
> +	params[2].package.elements = NULL;
> +	params[3].type = ACPI_TYPE_STRING;
> +	params[3].string.length = 0;
> +	params[3].string.pointer = NULL;
> +
> +	ret = acpi_evaluate_object(handle, "WBRF", &input, &buf);
> +	if (ACPI_FAILURE(ret))
> +		return NULL;
> +
> +	return buf.pointer;
> +}

But now all of a sudden you start calling a WBRF method
directly instead of calling a _DSM by GUID, which seems
to be intended for consumers.

This contradicts with the documentation which says that
consumers also use the _DSM.

And this looks a lot like acpi_evaluate_dsm and
... (continued below)

> +
> +static bool check_acpi_wbrf(acpi_handle handle, u64 rev, u64 funcs)
> +{
> +	int i;
> +	u64 mask = 0;
> +	union acpi_object *obj;
> +
> +	if (funcs == 0)
> +		return false;
> +
> +	obj = acpi_evaluate_wbrf(handle, rev, 0);
> +	if (!obj)
> +		return false;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER)
> +		return false;
> +
> +	/*
> +	 * Bit vector providing supported functions information.
> +	 * Each bit marks support for one specific function of the WBRF method.
> +	 */
> +	for (i = 0; i < obj->buffer.length && i < 8; i++)
> +		mask |= (u64)obj->buffer.pointer[i] << i * 8;
> +
> +	ACPI_FREE(obj);
> +
> +	if ((mask & BIT(WBRF_ENABLED)) && (mask & funcs) == funcs)
> +		return true;
> +
> +	return false;
> +}

This looks exactly like acpi_check_dsm().

> +
> +/**
> + * acpi_amd_wbrf_supported_consumer - determine if the WBRF can be enabled
> + *                                    for the device as a consumer
> + *
> + * @dev: device pointer
> + *
> + * Determine if the platform equipped with necessary implementations to
> + * support WBRF for the device as a consumer.
> + *
> + * Return:
> + * true if WBRF is supported, otherwise returns false.
> + */
> +bool acpi_amd_wbrf_supported_consumer(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +
> +	if (!adev)
> +		return false;
> +
> +	if (!acpi_amd_wbrf_supported_system())
> +		return false;
> +
> +	return check_acpi_wbrf(adev->handle,
> +			       WBRF_REVISION,
> +			       BIT(WBRF_RETRIEVE));
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_supported_consumer);

So I would expect this to just use acpi_check_dsm like
is done for the producers.

> +
> +/**
> + * amd_wbrf_retrieve_freq_band - retrieve current active frequency
> + *                                     bands
> + *
> + * @dev: device pointer
> + * @out: output structure containing all the active frequency bands
> + *
> + * Retrieve the current active frequency bands which were broadcasted
> + * by other producers. The consumer who calls this API should take
> + * proper actions if any of the frequency band may cause RFI with its
> + * own frequency band used.
> + *
> + * Return:
> + * 0 for getting wifi freq band successfully.
> + * Returns a negative error code for failure.
> + */
> +int amd_wbrf_retrieve_freq_band(struct device *dev,
> +				      struct wbrf_ranges_in_out *out)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	struct amd_wbrf_ranges_out acpi_out = {0};
> +	union acpi_object *obj;
> +	int ret = 0;
> +
> +	if (!adev)
> +		return -ENODEV;
> +
> +	obj = acpi_evaluate_wbrf(adev->handle,
> +				 WBRF_REVISION,
> +				 WBRF_RETRIEVE);
> +	if (!obj)
> +		return -EINVAL;

And I would expect this to use acpi_evaluate_dsm(), or
preferably if possible acpi_evaluate_dsm_typed().

Is there any reason why the code is directly calling
a method called WBRF here instead of going through
the _DSM method ?

And if there is such a reason then please update
the documentation to say so, instead of having
the docs clam that consumers also use the _DSM method.

Regards,

Hans



