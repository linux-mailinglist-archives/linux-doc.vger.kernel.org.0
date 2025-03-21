Return-Path: <linux-doc+bounces-41532-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1FBA6BF2E
	for <lists+linux-doc@lfdr.de>; Fri, 21 Mar 2025 17:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D50A17A1A5
	for <lists+linux-doc@lfdr.de>; Fri, 21 Mar 2025 16:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1912A229B28;
	Fri, 21 Mar 2025 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBt27kD4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E141DB366
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573359; cv=none; b=QGE+LsoC/0wqLI2tfhEdsxoyazSqiS3VTVZxMLWxEqqlNMQuIAfObA3FyRzQ1feAneDN6ecey1fAePFzIUWh1g/MHAsuVcHSqf600QmTvuYX/Rx3kvLWXgppXTVdJa1JSzowHaOXfgoAfrUVFgf3xdmY/qxveGafMW8yXV1En70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573359; c=relaxed/simple;
	bh=llZWZG8vrikSmiw8ydIW6hs/MJhHomqckp7K5dqW3d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVN97+fH9NBILsKpDYUkEvYlTG4gBZbGqi1JgOoNbycw6rYRW7p1yjT9ygOGzckjWgfJ0DPW8zTI03kV7Y/JZrdUvNhdp0e0LBMlM+T3LppOe4LcC3lkZ667IzDWgqFMK/677RW/gBBeWuLtEci2Ps10AhFGsGYGv6ts6N0X7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBt27kD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATLZG001160
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 16:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=; b=MBt27kD4ga1ISE1Y
	oYW+r5SB7YuIJ+WP2qd2UrnA9bVoMbvLpp5Ag6nBiypSs0xrww2+q4JskgZvPgEh
	FfXtDFZQSKbkuuGSua1GvghQRGqBh+9M0S6PEv7JSilvs2kl6QO1uM2FN2H7Zjnr
	LDT7PioLyMjyMH0rl3DqPfPkkWX9cjW4KzssK3WpktwvD0pvXnotcSGd2uKYVkCB
	JM/Tqlr0ZQUgjKJTcL48w3PJVc/nAGf82cwFwiuHmOegvi9e+AD/uQwQWf5RFnOc
	sVLDE2CO6twu/klPDlOell0cX7YaIgiWxafKlBrI1ye4lLVmpLJdRKzyD+3HWF3K
	IrpZ2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4u9s7mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 16:09:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224347aef79so50435215ad.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 09:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573355; x=1743178155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdOuElFLpccoJsuXgqKPQO+xF/9Y5vee1gm2/OiO0Gw=;
        b=WmaY1kGdFjjXydlSPwFh/xfq9KePkTGnFaGA74PfvHjS0h5+GxLZk3HLq4o3+Vx+4Q
         HnazTRS7enlivnWYrBFj7zI1nYVPlntyPYzpPYSOfWmmz/6mhF1JR2LNO3FYojHOLEEU
         vIWNZoCe0ysIaYhecNmPTox7eTFBol+2IczEUvKT5FNOc2OCo2XYGTtTuAbnJqxMz+1L
         K6XzmBkVpml5puKddrbJULIBoHZSxcPEbafddI3atxA9QmiMRXTmT7v+ssY9PGvwRq9+
         u2bw5hgtt7ZCDRsdDZtGTX6L7yqSAqUbEOXG8fretTfW36FHhclJhiiOLBgdYfvGRMT0
         qicQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7HvVhneIhFWdtkicb22uNt3YufsnCAGewJRaOCnwWJXuzlO5bDWaIQyzHtbZ93tO7kuPIqoKmznc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzTz9LGX7kHGuoi6MuyFZcTTZ+9AZ8C9iM1/w3CwqxvmJI7Aex
	kkria+I2psoXE/TYiMi8I3wdLTzF6K+PSydx9hyyhzYPSAgPJTgv2JIaKcL2gJZFEnmOslGqHQk
	ap2JA8NruSEMSpKn4hHyKej4f8+0xEByZdJFTEdh/jOVJf8/WSKtDoqdmTkI=
X-Gm-Gg: ASbGncvTsTTAegaAsHPIPlqFPd7KYKNNl+s+JOsXLIN6LNJtbLBES3/zXJg0DGSlroJ
	Xv+B6M/27ID/mr060sIVZSwVI0krSHfgZ5vzJNOfyY6DFmmZp6hEdLT0WKkbsu+X36DwEDlmsKR
	kDIB1srp143xfodY4EUq0dT1h35qET/Q6cDpJjgAdO7D46fEu3kWgWPBVChS8S5oeN0IybTH4Li
	TP+JPnvk8txdiye56LZVLuE8KUTuShUh6pgt44veuPZk3kiewknLuIZZRmsg64zNGD4ugCxuda/
	quqjX9ka7tFGQyWSKQ+wiQ/9Z+3XUBN/kHtoKFV7jjfkzwx41YceqFnHmMTpOPF/vw==
X-Received: by 2002:a05:6a00:4f81:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73905a530a9mr6797804b3a.21.1742573354444;
        Fri, 21 Mar 2025 09:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL5fYByHbvsD/gRtsSQfXYP8pBS52gj7BStPaMfEBPmc/gB4ybx9sZflEDEhvH+V7H0dixLA==
X-Received: by 2002:a05:6a00:4f81:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-73905a530a9mr6797719b3a.21.1742573353797;
        Fri, 21 Mar 2025 09:09:13 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27de717sm1957838a12.12.2025.03.21.09.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:09:13 -0700 (PDT)
Message-ID: <4d617199-191c-47d9-a0f1-5bf9c149d09d@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 10:09:05 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250225-6-10-rocket-v2-6-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rIzWFHkvgNDreB4ltMw3pMUpshVzghUD
X-Authority-Analysis: v=2.4 cv=FYE3xI+6 c=1 sm=1 tr=0 ts=67dd8f2b cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=otp63fjl-Mw8CRR8ssMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: rIzWFHkvgNDreB4ltMw3pMUpshVzghUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210118

On 2/25/2025 12:55 AM, Tomeu Vizoso wrote:
> +/**
> + * struct drm_rocket_task - A task to be run on the NPU
> + *
> + * A task is the smallest unit of work that can be run on the NPU.
> + */
> +struct drm_rocket_task {
> +	/** DMA address to NPU mapping of register command buffer */
> +	__u64 regcmd;
> +
> +	/** Number of commands in the register command buffer */
> +	__u32 regcmd_count;
> +};
> +
> +/**
> + * struct drm_rocket_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into account its
> + * dependencies with other jobs. All tasks in the same job will be executed
> + * sequentially on the same core, to benefit from memory residency in SRAM.
> + */
> +struct drm_rocket_job {
> +	/** Pointer to an array of struct drm_rocket_task. */
> +	__u64 tasks;
> +
> +	/** Pointer to a u32 array of the BOs that are read by the job. */
> +	__u64 in_bo_handles;
> +
> +	/** Pointer to a u32 array of the BOs that are written to by the job. */
> +	__u64 out_bo_handles;
> +
> +	/** Number of tasks passed in. */
> +	__u32 task_count;
> +
> +	/** Number of input BO handles passed in (size is that times 4). */
> +	__u32 in_bo_handle_count;
> +
> +	/** Number of output BO handles passed in (size is that times 4). */
> +	__u32 out_bo_handle_count;
> +};
> +
> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +	/** Pointer to an array of struct drm_rocket_job. */
> +	__u64 jobs;
> +
> +	/** Number of jobs passed in. */
> +	__u32 job_count;
> +};

These 3 structs will be different sizes in 32-bit env vs 64-bit env. Yes 
the driver depends on ARM64, but compat (32-bit userspace with 64-bit 
kernel) is still possible. They should all be padded out to 64-bit 
alignment.  When you do that, you should specify that the padding must 
be zero, and check for that in the driver so that you have the option to 
use the padding in the future.

