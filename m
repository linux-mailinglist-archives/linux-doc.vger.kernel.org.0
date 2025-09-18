Return-Path: <linux-doc+bounces-55986-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D148B255B2
	for <lists+linux-doc@lfdr.de>; Wed, 13 Aug 2025 23:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FCAE1BC3C71
	for <lists+linux-doc@lfdr.de>; Wed, 13 Aug 2025 21:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC243009FA;
	Wed, 13 Aug 2025 21:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cf01cekL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEA13009E5
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121071; cv=none; b=munbcZ+jiHDkLGJG6vHJiDkECBb3UXdbFe4mAb4ynpAyKVOmODn7D2J4/zMkhOLcZWj1iMkg1d2zMNuA+cT2pZRnvWKUb/L6vtoWmSkBle4DxeXgjEwVAPvQx/MWChjmFyN4EpoA0DZeyVDT9Mw/Ymswcz+P/FHz1ZLPkogPRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121071; c=relaxed/simple;
	bh=ccjfO4/u/lWDNF3S1R9u3rjC6s7tA1lPQElrO9joQz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biMoFSeU3IN6YHHA9SF7Diz+dWeZyTGEkp+Kld0YRWUcOlCHFI0DfdPxUvSi2jQmdT2y6jdGkj2yk58oliLdyUisXuXwTeyj3pZR27GQBuV1oLGEaQE0yWaUE3OoeyxeOD/fNINQGPUJqH6IQpdIl9sZH66OoopWoj0qjUv86f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cf01cekL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBM1P2013413
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SndjKr0RXE6OvRgCGGjccbf8K/ICQkhBHCI3TArlkI=; b=cf01cekLIKKmp6W9
	Q/KiEcVSMrq8AYF3X5UAHRYpvTK1X1DUORA9hux8y9uPE16/4CYrPgxKaBlLS7Yt
	nu4uuJGy4uEe0ZJA+FxLoQaRnAxi+rROX43B20wRy5W/TI7G92K0GbK4nPxZSO7h
	88vZpNMTG9DLSNeD6RzLLu6goYg2RtxJIrvIzGZIS8aZzL36z56spkA+iJy9APXr
	pdUvD1/tM+pL076SnTHA0TS58l0s+JVc+wkln+ka4tX8MCVy0dsINtixHmJUvP0C
	OlxTaUoYFDF27xosid1bq4nfJT02CtZEulMGareqAO0apCpLC1Rs4LUgsAyWMnKY
	mSGE0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxbfva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:37:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b471758845dso135269a12.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 14:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121065; x=1755725865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SndjKr0RXE6OvRgCGGjccbf8K/ICQkhBHCI3TArlkI=;
        b=FIWw0vz3RZSNkDCetbToGLIIlIEobCE6+a8shpMHcZvOLD6iK3puNVLbiGXctryON0
         Njg8c2FpNBHZftkS3tsjlOsVuiNvJDPTMabCMVF1ZpFTIwfXAkraHGd+zqf8jC8fXL8p
         rytplpxmg7dXQYLKz6Qi1zfoMkxb431rJjpVN/iM+7oxuQG97htVoW9u15b5A8j3EvHw
         kBpk6LhfWiPLaHXtpj9xbCdPMtVxD54OvBe5ZIkBob2yCcsnw/pKg3IC51tH3g9uKtag
         0ygMFqOyAVZYf/dqDN30Ra+Tl2eUBHzzJg9MAuL7YWI5cpbMyatP4ahF/8CTViidd0bl
         PfIw==
X-Forwarded-Encrypted: i=1; AJvYcCWaqTVZiOK2tVHj/vDRwnoSwKgZFHh1+ocYwU9YQ2e6PWI7NJyJRAbdN/0hISvg3eE+OtjhPydb32w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpb2DwjLwWYICY7e4iNVV0kIIEekIIlsXi5mRzx++wgkBPPPkU
	W5mgd0MkT6mKIYS+V5cxJ93xk7IjcFuzsfyWNRKdzBMPukcSElSHTdd+GJFD83D9yCPdYQCwVnU
	j72xJCJM4zr3FFgGIquSL4p88uUeieCBrUvxWnym/K71M6y6Legp7xJsh7nAwfw==
X-Gm-Gg: ASbGncshDftmA46xsYmyPQ3tr7Lr4CnLpOQcX+OSHQfEk7aHxZnmWfJgbbRt0NSmF2R
	Ojr0xVRoTDG/te0ZCRmFWAfFsExTBECdKqhPER7cwOC4mneRiSJyNAuar/bCU27STx7j2wsG5mP
	oIUs5gJg7ClPnJ0AJv2csS4rrNrlbUKgkhBnO/UqUkfapu+ueaj0RAB0UXVddeDJeSQ09Rj7Rko
	A2tfj4vfjB6CEch+1vZrCe3Po+EQHrpUivDVzWrjT5OcjJjXW59gyida7bA4bXKuTX6rIzrheFq
	KsJYs/taam54tQEOde9vMsJiWVl1Ryrn4CkgygRHlVTKPgRW/a1jOnZLwnKWPc8/v1BmN6dj6JK
	yL+9gVFHWSeZtJbz35uzZXJWobwgq7pn55i4Zkw==
X-Received: by 2002:a17:902:f68f:b0:234:a734:4ab1 with SMTP id d9443c01a7336-244584af4ffmr8494835ad.3.1755121065295;
        Wed, 13 Aug 2025 14:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuzWbzDav9fzDkocxmSvr5IQCdvgg5HSGiPWY/6Um64YBLDMk04VNr0wYVwa0mHQaKsHAjBA==
X-Received: by 2002:a17:902:f68f:b0:234:a734:4ab1 with SMTP id d9443c01a7336-244584af4ffmr8494365ad.3.1755121064760;
        Wed, 13 Aug 2025 14:37:44 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232578248dsm983697a91.16.2025.08.13.14.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:37:44 -0700 (PDT)
Message-ID: <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:37:35 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] firmware: qcom: scm: add support for object
 invocation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
 <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX/GUucu7dq2bU
 grFxvewiAhNIVjO+Dzhm8utjcl0ZYgjbtPWMjPRT3jTKG5g1MhfznPzw3+c4XrrkGREClah8AD4
 WgippJMBTysxOW3bVxCSjEIkNqxSphR2vKRK/jPo3W9q0MK+tcV00uJiACV9Vk8lxFtQSHZwrS/
 ow98vUyt9jw9xjPp4YlHvymiaVSy2rEc/aCpyZN1ugy3Wr2aHAubEyMA201o07K4YmkJ18nBpxe
 HbpkAPnK+Po3/v+xzd8NN+8kXe63jiXIxQyuYb7M2yPgr7eoh4iKlb8ed3NtBBdbY75wYweNGrZ
 8Df6F7WszZxlas7YlcFkQ0GHuqqqFsdhPF2KOlkUouFOUgdjoFKqB8RURqghzb+UyCfIi57CAES
 GBHoMPp2
X-Proofpoint-GUID: LxYc4SFdqMtVHPKUqKAkQRKS7Tk3yuqw
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689d05aa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=nTCLsnt1AoGLxjTXAKEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LxYc4SFdqMtVHPKUqKAkQRKS7Tk3yuqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 8/13/2025 7:53 PM, Konrad Dybcio wrote:
> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
>> the secure world, accessed via objects. A QTEE client can invoke these
>> objects to request services. Similarly, QTEE can request services from
>> the nonsecure world using objects exported to the secure world.
>>
>> Add low-level primitives to facilitate the invocation of objects hosted
>> in QTEE, as well as those hosted in the nonsecure world.
>>
>> If support for object invocation is available, the qcom_scm allocates
>> a dedicated child platform device. The driver for this device communicates
>> with QTEE using low-level primitives.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
>> +			     phys_addr_t outbuf, size_t outbuf_size,
>> +			     u64 *result, u64 *response_type)
>> +{
>> +	struct qcom_scm_desc desc = {
>> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
>> +		.cmd = QCOM_SCM_SMCINVOKE_INVOKE,
>> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
>> +		.args[0] = inbuf,
>> +		.args[1] = inbuf_size,
>> +		.args[2] = outbuf,
>> +		.args[3] = outbuf_size,
>> +		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW, QCOM_SCM_VAL,
>> +					 QCOM_SCM_RW, QCOM_SCM_VAL),
>> +	};
>> +	struct qcom_scm_res res;
>> +	int ret;
>> +
>> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*response_type = res.result[0];
>> +	*result = res.result[1];
> 
> These are dereferenced without checking, which will surely upset static
> checkers (and users)
> 

There is no consistency in qcom_scm.c; I see multiple instances where
similar dereferencing is already happening in this file. However, I'll
add the if (...) check to be sure. The reason I initially skipped it
is that this API has a single user -- the TEE subsystem.

> I see that res.result[2] should also return some (aptly named) "data"
> which you handled in v1, but dropped in v2 (without a comment AFAICT)
> 
> Looking at it, we could probably wrap it in qcom_scm_qseecom_call()
> which this seems to be fit for
> 

I cannot use qcom_scm_qseecom_call() because this is not a qseecom
transport. It's a new transport called smcinvoke, which, for instance,
does not require a lock.

The data field is intended for qseecom over smcinvoke, which we will
never support -- so there's no reason to return it.

>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(qcom_scm_qtee_invoke_smc);
>> +
>> +/**
>> + * qcom_scm_qtee_callback_response() - Submit response for callback request.
>> + * @buf: start address of memory area used for outbound buffer.
>> + * @buf_size: size of the memory area used for outbound buffer.
>> + * @result: Result of QTEE object invocation.
>> + * @response_type: Response type returned by QTEE.
>> + *
>> + * @response_type determines how the contents of @buf should be processed.
>> + *
>> + * Return: On success, return 0 or <0 on failure.
>> + */
>> +int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
>> +				    u64 *result, u64 *response_type)
> 
> These should be aligned

Ack.

> 
>> +{
>> +	struct qcom_scm_desc desc = {
>> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
>> +		.cmd = QCOM_SCM_SMCINVOKE_CB_RSP,
>> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
>> +		.args[0] = buf,
>> +		.args[1] = buf_size,
>> +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL),
>> +	};
>> +	struct qcom_scm_res res;
>> +	int ret;
>> +
>> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*response_type = res.result[0];
>> +	*result = res.result[1];
> 
> this also seems like a good candidate for qcom_scm_qseecom_call()
> 

ditto.

> [...]
> 
>>  /**
>>   * qcom_scm_is_available() - Checks if SCM is available
>>   */
>> @@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>  	ret = qcom_scm_qseecom_init(scm);
>>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>>  
>> +	/*
>> +	 * Initialize the QTEE object interface.
>> +	 *
>> +	 * This only represents the availability for QTEE object invocation
>> +	 * and callback support. On failure, ignore the result. Any subsystem
>> +	 * depending on it may fail if it tries to access this interface.
>> +	 */
>> +	ret = qcom_scm_qtee_init(scm);
>> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
> 
> This will throw a WARN on *a lot* of platforms, ranging from
> Chromebooks running TF-A (with a reduced SMC handler), through
> platforms requiring QCOM_SCM_SMCINVOKE_INVOKE_LEGACY (0x00) cmd
> 

Are you suggesting I remove the WARN? If so, how should the user be notified?
Should the error simply be ignored?

> Konrad

Thanks,
Amir



