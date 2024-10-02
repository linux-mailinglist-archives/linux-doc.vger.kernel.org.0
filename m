Return-Path: <linux-doc+bounces-26311-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1A598E200
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 20:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8847A1C22E17
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 18:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDFE8F58;
	Wed,  2 Oct 2024 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="epDG35Aj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C352A1CF7AE
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727892015; cv=none; b=ovc1I8XunQeE8QUPrVY/uS3n7UJCWpS11ojZdZb1uKf8/IDVfblmYS8j5J4SUZPx3zwWHOxDcvstec5YyEzo9aBOwHe/pyr10TjDYw7fcFhdeUu3B98pXTazM6LrfTC/RrdDg/9E1Az4yaPUv1+uqj4i5DfoZTjOWZMyr+zGUO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727892015; c=relaxed/simple;
	bh=VXOOUNdnAEhPqciXyVZksZiXTp0bQQtRDANzdI1gkBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyTzyjt8jU9l91tN84/1VLkdQcrEjPy8Z0dWU+YK0BwHTWLfa9r3tQ/vADTim0srP1QkIdcbPYcmWqcF7X3chycjOM4DGmn0NHrvAqTC41MX/qfv2HBrmCkkDoqY2JsllBPPwA2hsxvdgmiqblgRat6u/FCB/lBKExRpd4+kYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=epDG35Aj; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-82ce1cd202cso4864039f.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727892013; x=1728496813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2ii6GPB8LbcDkdZtu/vEyeCXjQrhQgW3fBbVs7hZZg=;
        b=epDG35AjWOTR3ZFt2UlUdU+I4KpFz+LfzyeqB6CdD/KXyxZ3f9DWXq33XR9yDNsN3D
         4BsYR7Lvr9rL+DKqEK10qyqPk4rCJQ3uz60fZ+B/jtwWgwFFivuyiTQdyb0V/DakKww/
         jGmgy0oroINrUs29ocEuxqfAYlFTjSxoH84nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727892013; x=1728496813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2ii6GPB8LbcDkdZtu/vEyeCXjQrhQgW3fBbVs7hZZg=;
        b=OjL8f2pMsh39iEj91myLWAfAgl0YoUKjmmUaR0LZ5ejXrIsc0aEmhoWvbuEuIS06my
         yu6LfnIJ8QhnULj23kCrk64zXS/DO23KYIctCL089VANXCeIil563ChU/A/ITHu7PGyS
         Cq7WqSj5iCz5NCgGY24z52Z86omtHTELgCP28OMSk/0YP6/mtOmO+VNtPRzDuORFfX8T
         JWViHX0fKM+NMEK5UXxX6ZpvqjiJ7amuXMfFfVrquUTpTRHS/KWK7JJELHVEeNocbrff
         WoT6+jqRYP8ZPgc0AuaMa5KtYs27e9EoD881m63yVorJ7EjwAuvPHMU22OXK9ZJPPOsA
         Lqfg==
X-Forwarded-Encrypted: i=1; AJvYcCUKCnWN0WxgfZrQ2jGsE+RsyBHbhPcHJ1hPoLVHvSEtIg82J/hdoUjx/iMy9IaQdG2DCI9yiYipdi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWbIoRsW6h6SAR6VWVO0eqDBSUk9G12iSKzWG/lPXkA5Tyj+CW
	j2588+CqpDm94qpcnOW1Ykx3vjfnAOh3tk+LtrwgC2D2a6Ewf6QRBlS0sF5VYVE=
X-Google-Smtp-Source: AGHT+IFZG+oK4eRQhMYCZ+1EA/WngOtJ5AXbNw+nKvg+PAQy26l2faeXkJTKlKwWhIU/wZbdksh8gQ==
X-Received: by 2002:a05:6e02:1a6c:b0:3a0:9026:3b65 with SMTP id e9e14a558f8ab-3a365954e63mr38914205ab.25.1727892012800;
        Wed, 02 Oct 2024 11:00:12 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d888835090sm3187850173.15.2024.10.02.11.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 11:00:11 -0700 (PDT)
Message-ID: <0040a842-de9c-4f9c-9d61-c1bfbd010470@linuxfoundation.org>
Date: Wed, 2 Oct 2024 12:00:10 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dev-tools: Add documentation for the device focused
 kselftests
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241001-kselftest-device-docs-v1-1-be28b70dd855@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241001-kselftest-device-docs-v1-1-be28b70dd855@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/24 09:43, Nícolas F. R. A. Prado wrote:
> Add documentation for the kselftests focused on testing devices and
> point to it from the kselftest documentation. There are multiple tests
> in this category so the aim of this page is to make it clear when to run
> each test.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> This patch depends on patch "kselftest: devices: Add test to detect
> missing devices" [1], since this patch documents that test.
> 
> [1] https://lore.kernel.org/all/20240928-kselftest-dev-exist-v2-1-fab07de6b80b@collabora.com
> ---
>   Documentation/dev-tools/kselftest.rst       |  9 ++++++
>   Documentation/dev-tools/testing-devices.rst | 47 +++++++++++++++++++++++++++++

The new file needs to be added to Documentation/dev-tools/index.rst

Docs make should have warned about this?

>   2 files changed, 56 insertions(+)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index f3766e326d1e..fdb1df86783a 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -31,6 +31,15 @@ kselftest runs as a userspace process.  Tests that can be written/run in
>   userspace may wish to use the `Test Harness`_.  Tests that need to be
>   run in kernel space may wish to use a `Test Module`_.
>   
> +Documentation on the tests
> +==========================
> +
> +For documentation on the kselftests themselves, see:
> +
> +.. toctree::
> +
> +   testing-devices
> +
>   Running the selftests (hotplug tests are run in limited mode)
>   =============================================================
>   
> diff --git a/Documentation/dev-tools/testing-devices.rst b/Documentation/dev-tools/testing-devices.rst
> new file mode 100644
> index 000000000000..ab26adb99051
> --- /dev/null
> +++ b/Documentation/dev-tools/testing-devices.rst
> @@ -0,0 +1,47 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. Copyright (c) 2024 Collabora Ltd
> +
> +=============================
> +Device testing with kselftest
> +=============================
> +

Get rid of the extra blank line.

> +
> +There are a few different kselftests available for testing devices generically,
> +with some overlap in coverage and different requirements. This document aims to
> +give an overview of each one.
> +
> +Note: Paths in this document are relative to the kselftest folder
> +(``tools/testing/selftests``).
> +
> +Device oriented kselftests:
> +
> +* Devicetree (``dt``)
> +
> +  * **Coverage**: Probe status for devices described in Devicetree
> +  * **Requirements**: None
> +
> +* Error logs (``devices/error_logs``)
> +
> +  * **Coverage**: Error (or more critical) log messages presence coming from any
> +    device
> +  * **Requirements**: None
> +
> +* Discoverable bus (``devices/probe``)
> +
> +  * **Coverage**: Presence and probe status of USB or PCI devices that have been
> +    described in the reference file
> +  * **Requirements**: Manually describe the devices that should be tested in a
> +    YAML reference file (see ``devices/probe/boards/google,spherion.yaml`` for
> +    an example)
> +
> +* Exist (``devices/exist``)
> +
> +  * **Coverage**: Presence of all devices
> +  * **Requirements**: Generate the reference (see ``devices/exist/README.rst``
> +    for details) on a known-good kernel
> +
> +Therefore, the suggestion is to enable the error log and devicetree tests on all
> +(DT-based) platforms, since they don't have any requirements. Then to greatly
> +improve coverage, generate the reference for each platform and enable the exist
> +test. The discoverable bus test can be used to verify the probe status of
> +specific USB or PCI devices, but is probably not worth it for most cases.
> 
> ---
> base-commit: cea5425829f77e476b03702426f6b3701299b925
> change-id: 20241001-kselftest-device-docs-6c8a411109b5
> 
> Best regards,

thanks,
-- Shuah

