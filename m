Return-Path: <linux-doc+bounces-56005-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF41B25748
	for <lists+linux-doc@lfdr.de>; Thu, 14 Aug 2025 01:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97AFE7B46E3
	for <lists+linux-doc@lfdr.de>; Wed, 13 Aug 2025 23:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757EA301461;
	Wed, 13 Aug 2025 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8zOzJHE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6D2F4A06
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755126491; cv=none; b=eJ6UCEFriI7XBF71FjfpdPQs5nKhmY4z8qWmJJx2rYueREhJN1NRChI1ImyRwoh8v6lGdhhXldB3Z9ZSl0A5pw78b1tIkmTTlBwsb6LnsuqMtvK5o5GRnBTgUN09bHLDnWdC3Z4kjeghJk5NyotTrKpcnCVpHkufq1vVkgu9E7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755126491; c=relaxed/simple;
	bh=dZUMsPsqmDcein2OBiKoR7Gxr/AXiObKpVab7TXGqdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orEyR/AQjD96LpqBxPWDE7uIhiKLoMvpEoUzxp23zq5atXMxBOB7pWh9Oma7zhejx2btDuradAdiV8I+Ms0wq6qdMp5lB61YlpVQqJRaTG8708hYVOml7xCXucaxgF4PRb8nfHZS+ELeJWAhijTlDU+cPSPzdKlyly250eS5APk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8zOzJHE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMHT2Q002874
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcBAK8eEeC3gYozyTRH3zfy0KnL/G+SterUWthRRl60=; b=U8zOzJHEoKmIQoET
	t4wcKyCFI4yA7ChPpRqtIZQQBQYhyHrWSjqOlZWfYSpUyY5Whw7jdUvGQ4uwLXz5
	m6tZJLWSeSkAZNn0z3M6uztHqlpsjd/4NqB8zlSEz65n3qqfkYMPMset8EKCxqOK
	4iOUP5Vu1pT75vbH8gxV1pP4tJhOfyYzY65iJ+XX5JbsXtXIuXwqyAKx77lfnqoN
	6mNNV3auWxk7Qx+aESf/UqpEybNFf83IBGLkWIknnFkCaAK6787ixCAXyPDPfB4l
	QdQZnybKpgRUJUJDa123Glpx5gwFmI/fNh1vPNXdpRBH+Yo3orQ6+VnyQROj/uPX
	ceGGyQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv5gke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:08:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32326de9d22so333278a91.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 16:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755126487; x=1755731287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcBAK8eEeC3gYozyTRH3zfy0KnL/G+SterUWthRRl60=;
        b=LrYoSgzFtAfCHMZL3F73WNqSzwS+t4NPdHd4yuFRCATMsyrVsaVy5AT8tGKufaEsCF
         Cyphlhc/gYC8H+X4QvShxFFw52Ac7carSq3MWPVzydgZDh3v+Klb18JIYTnKd/sVXUNV
         ROp4W0CcuNdnyJLTGxZkJYAGq81m9O8hccov7DOBGcMnSrln7WpaYrWJo8PKEEpCtIeO
         6RPN7C/eRvEo8RmmAE9P6G4NwOPiMQQOSJpRU7MxMpQgOafDAst0hPyobCUUCliC3i7M
         E+NrXv/aZdibHolAefVQv2Zq7raO6TMpcyr/5Y1c5onre4XswCL8Lck/60+0rXb4ZKz5
         tqHg==
X-Forwarded-Encrypted: i=1; AJvYcCXIoXgWEMrQWQ3xDgK4C6eqAVc5hP+7wbswf5Fyp8qzHAomteAMSX4ZCjqVFTNUHbM+0Kfex/lmeoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsxhAbyFDpT4EFcWrb8z/gs0d9gVJwKGaF1CXIcDr9e0gDdTif
	+edPFKLX61vH1WnSe+8XWcxl4M7WMzTFeIuevDg0TAT2yBR06JJEy+kGBEYfkV989bFhmUGLRBu
	5FXSPEzH90s/OV3c7LzUPQE2VA6bvsk/bJJwX/oZQsjkiXUzOPyHkI6aATIcNGtS4NPaaw6FE
X-Gm-Gg: ASbGncvE4NpK6InCla7FIpxvLcnV92hZyCqxd65DJN9emq4qCJMS9Kt/QonqwyiQcdm
	3sPZeZff+qarNb+CPitFG0c5YTKkVqSXiAUFOAiA0QhTC1uVNvmL+9FpsLm16iLXFuZwfnKr06T
	EklNnsNBjihE9rHNaHzfnb5CQdLW1g3wlK49qTHl02vR/qKOuMHJNfiPWnlgXD0Ycyzd5eAQ9ea
	uSs2SntenZ5+jCwflachIv3wbHD9bFkl5oJ2kQ1zD6fYcvSPJenVCgJoRXqsewBH2xVt8yeE17O
	PhdSRYNwztS8w82HdTZQ0EBSSjuEhaDQiGfWRIIoFPfkqgm0OAcbRLSqV6U8htXLzfwcZuStxOV
	WTas2FtADg2ieY/VKdaRPQYoQiPqlONiiLMzB2w==
X-Received: by 2002:a17:90b:580e:b0:313:d361:73d7 with SMTP id 98e67ed59e1d1-32329ae3857mr664173a91.13.1755126487051;
        Wed, 13 Aug 2025 16:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAb97Pa0qtCkny2T4Bm3SgwY7hxlZeUaAqrAvqEuROtklAwf8KwhQzp8LvQNNm/xytIym38g==
X-Received: by 2002:a17:90b:580e:b0:313:d361:73d7 with SMTP id 98e67ed59e1d1-32329ae3857mr664147a91.13.1755126486585;
        Wed, 13 Aug 2025 16:08:06 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422babfbbdsm28366124a12.35.2025.08.13.16.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:08:06 -0700 (PDT)
Message-ID: <7aa7035f-d2c4-4c00-bc46-2e98d4c2641f@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 09:07:58 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
 <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
 <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d1ad8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AwBIn8DhAZiLWRgty54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0D49YDAsDK8liiZva2rl4sSMYtCexPAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXy8mK82Yqd9fy
 X8cDSFFv6QLxvBSDK3JfGd4g10e16kZlTQQY3Dhalw5gOotuu3+CCAeVQrZArLNpCTqsMmJxMuK
 LOpzn78S3q/tsEORfaY6If96cz+yRwDsQ97damONQFqKYCifxvNWXAx0ElEUKLuVTcUf4exsYLu
 vpihfVYI0U6AvTjWiX/sGb5v/jpzZtfu75QrX+9REcC8p+tYgxYv+7LuoP9f5Dik3hzunJXw6Rr
 3dMO6OZu2Xa4Te9o6WhK+YRWrj6t590IvYR/R08lFCLKJN1tQq0xyj8T4BpTlzU/qCqTXzQk7X7
 WCt/QNeooxU9uttAZ3qCdEhedoMbZ32+nJhRwyayCxp+0qtHSIupe0/IMzbmFdAne7il4a1pHxL
 65wI/SP0
X-Proofpoint-GUID: 0D49YDAsDK8liiZva2rl4sSMYtCexPAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 8/14/2025 8:49 AM, Konrad Dybcio wrote:
> On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>> Enable userspace to allocate shared memory with QTEE. Since
>>>> QTEE handles shared memory as object, a wrapper is implemented
>>>> to represent tee_shm as an object. The shared memory identifier,
>>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +/* Mapping information format as expected by QTEE. */
>>>> +struct qcomtee_mapping_info {
>>>> +	u64 paddr;
>>>> +	u64 len;
>>>> +	u32 perms;
>>>> +} __packed;
>>>
>>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>>> TZ will always be little-endian, regardless of the host OS
>>>
>>
>> I'm not entirely sure how this point is relevant. As I understand it,
>> the core that populates this struct is the same one that accesses it in TZ.
>> Your argument would absolutely make sense if the host and TZ were operating
>> on different cores with distinct architectures -- such as one being
>> little-endian and the other big-endian, which is not the case.
> 
> CONFIG_CPU_BIG_ENDIAN=y exists on arm64
> 
> Konrad

That’s not what I meant. I understand we have this config value,
but the argument is whether, in an SMP system, we expect one core to
operate in little-endian mode while another operates in big-endian mode.
I do not believe that is the case. Then it becomes irrelevant.

Amir


