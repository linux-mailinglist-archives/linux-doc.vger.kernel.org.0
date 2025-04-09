Return-Path: <linux-doc+bounces-42690-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 264BDA82016
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 10:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16CB88A1279
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 08:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E6323F412;
	Wed,  9 Apr 2025 08:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BvGAzz5l"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D11DE2C4
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187424; cv=none; b=h445ligCLQL2ys+UAgZENcIsB3Cd+fVdy2A6cPz5Gxz59ot1+0yGyXAKFgvQtSSsqxlHGAfxY8Cv6Wyd3K7TemdJVvTfnVDim4pxELVKcGZ2iv+hBfs084HAZUsQUiJxhGBGzPgtNh3JasJB4rhBsRQ7wPGRa6IwdEDYA4nFe04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187424; c=relaxed/simple;
	bh=lJe2X2F9XCDOb+/4v0nNyUHizu6HxT8GS7RKz43UiGk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JyMYZR7sbJUPe8n6l+AiL8cpYAcg/6shKr79xEabmXbpHsMwnzQjRvTWCODUCcDaCKUi1Z7ATlm1ULqgB5xRdFEn6tRQhSevVkE6dF4oP3Kg2qgKbGGrVPBdO8ffAACr+4DEZBVcawgnRe45hKclEMQ8SqLm1nzAyXOAs3rRgHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BvGAzz5l; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so32971565e9.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744187420; x=1744792220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NSePx0FSzul4z64RbYTcrnqX/8oJkOBY/MIB1WwBFY=;
        b=BvGAzz5lZcD5xoXF+W8+jWR7kRReWK02DgnkS5f3g1SZvMcWzFysrPdc0meQJslfo+
         VrC+9JpdO0RW7OUkdlXHIifODRjd+foC5lVWDBUkY+Cs0vQxsw7Val89/Jd5S57NSvPn
         bNIYD1dAJbySYXJ5Xmry4MwPU6DKtreI0Jqi/ebpGj05gceof+gTWTlFEQM1X8fwS7pr
         kNWICzYFOGbYvcvMdEo5F8BzK7vWuQd4nb5p0KnDAbFB1pDjkQeaRQwROObr7mS+3GnH
         u5EuizP0U6k3OGk/z8pi+kJGcYtdL6Es2cIegl6A3qbMFLMjstuqonl8HyCMMr/y3HeD
         m/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187420; x=1744792220;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9NSePx0FSzul4z64RbYTcrnqX/8oJkOBY/MIB1WwBFY=;
        b=P6yXRD3ZQCYh+JwvlyauWV56SmOmdEO0bXKTI5kYgpHsz0jdTJWEpklzR7b+owhIvj
         wxGUrFgtC9cyF/d5LjB1kPHk2MRT6zGDFlVZSmWtBmgbp1bcgKXCWi39+pzrp7ox0pnQ
         +KFGtCEuZDKIg3moVDWC4z4/8Syux1ceuGgcRELC7lhW/JJOAV+ruhAP5NI4HH7ER9zP
         ibEF93XOI+2fsri763rUV6uVx0oik2Pz/SNazmqF9t+0fLMDvX+NyUF7BA8Bl6T/aOL1
         ptWrH6yIPLUj5S6KVj3Zyj6kWafGHTBpjD91E9JhoPF5cjzjU5JNey0fl13F7Bwcr4Kd
         A4kw==
X-Forwarded-Encrypted: i=1; AJvYcCXNjef1m5acYQRG3f5cRL1goGluPTz7QJ+5GPaevvwAVtXUzSBvPxOmHTwWfkpbU4gvehXaKehG0X8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Er6Rv7F0LwzC303in6BbSiHP4q3tihblJ+cmBkclUi+Ch0/l
	ENBVbz7v/J/KHEawjM2yo+ADi7iUS2NzbBcWLoirb5kREuU1GQ1obSn6EANd1Vc=
X-Gm-Gg: ASbGnctslPBOlfpy8Fdrmtm5dc+mivtv+sUZw2ZltcLWXLDn159Trh1LgYwQYq6mpEz
	2/zoKpN6jnv+VHcF8NOn4sGj0virWImTJQd+z0zl7OEzC33ePVTSRivLI5H2b1Bu2SZcJYBEoh2
	tkQRWYfAIIzP3nKsAw07ZfRdsCStoV23gVxl7oDLSIkChk6E5WFpoMSZusLLtEmlF5QEC3+PLgb
	avQ3DCxb70yuCmomzetpDG3xofwBc6BoH3uyX5egGEAQmNAPLs8KyrlfpFItvyjdy1lIgSI8b6Q
	1nf7nOH3umG7qn/Spq0Yj8OurMCtQu5O4ULS65j2bOp2liGjbSbaP6H3trLxEKnZhIm23jL5U2l
	w6eNsv3A12ganHUb+pQ==
X-Google-Smtp-Source: AGHT+IFySxe0z8NxaNGGcfgDc0MjfyPIqBjFQlVyDAxqi0mPDxdzLAVrQhkB5ZyAMLLHhx4GCwjrDA==
X-Received: by 2002:a05:6000:40c9:b0:39a:c467:a095 with SMTP id ffacd0b85a97d-39d8852e91emr1424483f8f.24.1744187420186;
        Wed, 09 Apr 2025 01:30:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:87d9:979a:1261:ab65? ([2a01:e0a:3d9:2080:87d9:979a:1261:ab65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0a11sm917127f8f.73.2025.04.09.01.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 01:30:19 -0700 (PDT)
Message-ID: <fd9ac8f1-94ad-460f-8ca7-e56724416fcf@linaro.org>
Date: Wed, 9 Apr 2025 10:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/03/2025 03:47, Amirreza Zarrabi wrote:
> This patch series introduces a Trusted Execution Environment (TEE)
> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
> and services to run securely. It uses an object-based interface, where
> each service is an object with sets of operations. Clients can invoke
> these operations on objects, which can generate results, including other
> objects. For example, an object can load a TA and return another object
> that represents the loaded TA, allowing access to its services.
> 
> Kernel and userspace services are also available to QTEE through a
> similar approach. QTEE makes callback requests that are converted into
> object invocations. These objects can represent services within the
> kernel or userspace process.
> 
> Note: This patch series focuses on QTEE objects and userspace services.
> 
> Linux already provides a TEE subsystem, which is described in [1]. The
> tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
> can be used by userspace to talk to a TEE backend driver. We extend the
> Linux TEE subsystem to understand object parameters and an ioctl call so
> client can invoke objects in QTEE:
> 
>    - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
>    - TEE_IOC_OBJECT_INVOKE
> 
> The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
> used for invoking services in the userspace process by QTEE.
> 
> The TEE backend driver uses the QTEE Transport Message to communicate
> with QTEE. Interactions through the object INVOKE interface are
> translated into QTEE messages. Likewise, object invocations from QTEE
> for userspace objects are converted into SEND/RECV ioctl calls to
> supplicants.
> 
> The details of QTEE Transport Message to communicate with QTEE is
> available in [PATCH 10/10] Documentation: tee: Add Qualcomm TEE driver.
> 
> You can run basic tests with following steps:
> git clone https://github.com/quic/quic-teec.git
> cd quic-teec
> mkdir build
> cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON
> 
> https://github.com/quic/quic-teec/blob/main/README.md lists dependancies
> needed to build the above.
> 
> This series has been tested for basic QTEE object invocations and
> callback requests, including loading a TA and requesting services form
> the TA.
> 
> Tested platforms: sm8650-mtp

Does it requires any DT changes to be tested on other SM8650 devices ?

Thanks,
Neil

> 
> [1] https://www.kernel.org/doc/Documentation/tee.txt
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Changes in v3:
> - Export shm_bridge create/delete APIs.
> - Enable support for QTEE memory objects.
> - Update the memory management code to use the TEE subsystem for all
>    allocations using the pool.
> - Move all driver states into the driver's main service struct.
> - Add more documentations.
> - Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com
> 
> Changes in v2:
> - Clean up commit messages and comments.
> - Use better names such as ubuf instead of membuf or QCOMTEE prefix
>    instead of QCOM_TEE, or names that are more consistent with other
>    TEE-backend drivers such as qcomtee_context_data instead of
>    qcom_tee_context.
> - Drop the DTS patch and instantiate the device from the scm driver.
> - Use a single structure for all driver's internal states.
> - Drop srcu primitives and use the existing mutex for synchronization
>    between the supplicant and QTEE.
> - Directly use tee_context to track the lifetime of qcomtee_context_data.
> - Add close_context() to be called when the user closes the tee_context.
> - Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com
> 
> Changes in v1:
> - It is a complete rewrite to utilize the TEE subsystem.
> - Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com
> 
> ---
> Amirreza Zarrabi (11):
>        tee: allow a driver to allocate a tee_device without a pool
>        tee: add close_context to TEE driver operation
>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>        tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>        firmware: qcom: scm: add support for object invocation
>        firmware: qcom: scm: remove unused arguments to the shm_brige
>        firmware: qcom: tzmem: export shm_bridge create/delete
>        tee: add Qualcomm TEE driver
>        qcomtee: add primordial object
>        qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
>        Documentation: tee: Add Qualcomm TEE driver
> 
>   Documentation/tee/index.rst              |   1 +
>   Documentation/tee/qtee.rst               | 150 ++++++
>   drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
>   drivers/firmware/qcom/qcom_scm.h         |   7 +
>   drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
>   drivers/tee/Kconfig                      |   1 +
>   drivers/tee/Makefile                     |   1 +
>   drivers/tee/qcomtee/Kconfig              |  10 +
>   drivers/tee/qcomtee/Makefile             |  11 +
>   drivers/tee/qcomtee/async.c              | 160 ++++++
>   drivers/tee/qcomtee/call.c               | 759 +++++++++++++++++++++++++++++
>   drivers/tee/qcomtee/core.c               | 810 +++++++++++++++++++++++++++++++
>   drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
>   drivers/tee/qcomtee/primordial_obj.c     | 116 +++++
>   drivers/tee/qcomtee/qcom_scm.c           |  38 ++
>   drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
>   drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
>   drivers/tee/qcomtee/release.c            |  48 ++
>   drivers/tee/qcomtee/shm.c                | 146 ++++++
>   drivers/tee/qcomtee/user_obj.c           | 710 +++++++++++++++++++++++++++
>   drivers/tee/tee_core.c                   | 159 +++++-
>   drivers/tee/tee_private.h                |   6 -
>   include/linux/firmware/qcom/qcom_scm.h   |  31 +-
>   include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
>   include/linux/firmware/qcom/qcom_tzmem.h |  15 +
>   include/linux/tee_core.h                 |  15 +-
>   include/linux/tee_drv.h                  |  52 ++
>   include/uapi/linux/tee.h                 |  54 ++-
>   28 files changed, 4434 insertions(+), 32 deletions(-)
> ---
> base-commit: db8da9da41bced445077925f8a886c776a47440c
> change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527
> 
> Best regards,


