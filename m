Return-Path: <linux-doc+bounces-42680-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F83A81E23
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 09:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0E21B6593A
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 07:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343D025A2AA;
	Wed,  9 Apr 2025 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KaBGxeqq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8EB259CB3
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744183223; cv=none; b=Zfoy4nUHsPdLyiLf0dxBKpM7NLzAmh+Xzj+oT2+s0BSpplAKLbHAFqUiy2WaRcA7J9lNKoo9YtIG8atojGR75MGUxl5d5JnqowQhJtXgi11CPNHoY+mBc1cAbS33KfaqPdFHYRB2EpB7iUbQ3xZ7rQ9/DBwXJlynM6rbUaYvBnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744183223; c=relaxed/simple;
	bh=ZqoYRiPPhpkG4DWzQzpdvmtV6ZetBIyExICzCJaTWsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fckmRlmTXvWUhWB/JebFQMxE9U3bhE7gR6D11PEalAJOPKcegdXc667wfNn4O6CRbJ3L1G+3MXa5f+MPKDg9zNbeSLl6ITH09V99geT+Nrd5x0WIVROx4oIrOBsfN3eygGz56ZTBNlSh07YYVqPsfSanKSpkF4xfGtjex+efd4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KaBGxeqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYvKt002332
	for <linux-doc@vger.kernel.org>; Wed, 9 Apr 2025 07:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnHG1OYCfPPudOSu2HwBIGccZD+wMyHsRnvCxO1mKAo=; b=KaBGxeqq9+rMBoHF
	43Hsiy1cCegeyUwq+P5gohCLRYJpbwBanNYCkw36u4Jj+StAcC5oWhD7fWcTm19p
	3RTs75dwRiMWcWPjbjEgF2fWqSdSudOjcxGCvpTg7CycCa6maICeDiLYajm0Yn7t
	5ADUkgeCnRscvQpYk9U01tySnMJ5gVMP7+eI4bDuCtRkUHroEzHYaWcLSqwAq+yu
	NRqDg3ps0xhyize/s463nrMelqAcilB4JltfgUW5kC3gckkx5Bx1o4Xr0WYagH/0
	k5cWh27sF9gRK3YWenGA7OWf8mw7AoGRqMtMuR7EF25B72qJhj1N8C9S9A8HygFD
	mEa+EQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1javu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 07:20:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225505d1ca5so55499375ad.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 00:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744183217; x=1744788017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnHG1OYCfPPudOSu2HwBIGccZD+wMyHsRnvCxO1mKAo=;
        b=iiPNjAef2WXdig1/DZ9Mm9mQl+Jc9JvjwpZ6dF4nYdrdZHoJvU7tICwlDMeyezGuKM
         Yzqx5v4Y9EZ1oKPGtzKCuTGuiYhVSzdUZuYDPfwJDRqfbiudekJcLoFiVEf9/uvDtM1k
         tx5pdX1TyOClbpEW8neJi5c0CdhV6hbXF0qp+6OFgVYTb0QsUs+CSyVgv/6q/1f19cam
         P8ARoijPyBTqyh0QqK5WJV2SnkeCIClrfpg1c2LVzNcV4SxDv3+ypoxsFHJmRgO4+nCy
         ldcFNubatJsDyNM2v1yp1g/d0iRNEaZfOEkPuURSMI+fVGKL0KgbSqtxkAOeF+wvTxhG
         XGjw==
X-Forwarded-Encrypted: i=1; AJvYcCXCj2AY8A5kkbCGDrYSgsxSBFM20z106XNW7o1ZaD4S6mqgYDpJpGa8m7tfbChrfHltB0TzBndGSCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnMGpVfEIAmE8EFHvdtGKItj+/EWf+fQ/OQ/vukCZnlv7pmEY
	4vm2CLUGdsqpjS5tljh+ewajLwqGF0Nk7BkU+bo6Tp8kovobvm7AhZfbL56PWrrDEmdZOf9c2fN
	93rYjMEORkoFfePGyFzc1NzLp213ved2bp2ZX+MK+G4ej2VnhG8OiEd4Aow==
X-Gm-Gg: ASbGnctSwjNAgCGDZo0ZMmmOV3LUj5iSvebt/vGrv0nrPYs3akfN9KyVKu8A6C7OU8C
	v2tmYbdVx+4pxA8V7AiIMeNaukMMDzo0JtMY3HmL0iEdC9/wfJLMHk5lgU3mBWQxjqPoNFoaE9p
	dCCmuRPMq3KH53L8PgoALcDtsHbq7Jt+EktGwTrXttTDrFSPzIv3mmtW58YzrlzUCPvGmiSeNQK
	q6hYmts9Xq3PANV3yrj3kb/RBc/zlt3E+MKdbGLNxQh9o13XiNv0mCs6ZTS5G0QebcbjcXYPt4X
	045DQi60DHuKhE+PBqhaXsS8mtxgBIriIRwH5pEzGAe7x9nc5bFurDVzGYjOKAf0VR1QA6KJ9S3
	aOU8+tgihpQ==
X-Received: by 2002:a17:902:d4d1:b0:220:eade:d77e with SMTP id d9443c01a7336-22ac2a2dc06mr29218855ad.40.1744183217187;
        Wed, 09 Apr 2025 00:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH48eQqBlHLG2LOQMd75giBu4S3n/GO+s+65l9Tu7JVN+Rxfeq5xP7Ob5HmoQCV0KWtQk+8zg==
X-Received: by 2002:a17:902:d4d1:b0:220:eade:d77e with SMTP id d9443c01a7336-22ac2a2dc06mr29218535ad.40.1744183216712;
        Wed, 09 Apr 2025 00:20:16 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654a2sm5007835ad.49.2025.04.09.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 00:20:16 -0700 (PDT)
Message-ID: <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:20:08 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
 <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
 <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com>
 <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GtlqE31rmnsJx--3Bt31jd7NXzoy2Tca
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f61fb2 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=AUF5Mc4sii5JqdCOvnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: GtlqE31rmnsJx--3Bt31jd7NXzoy2Tca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090031



On 4/9/2025 4:41 PM, Jens Wiklander wrote:
> Hi Amirreza,
> 
> On Wed, Apr 9, 2025 at 2:28 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Hi jens,
>>
>> On 4/8/2025 10:19 PM, Jens Wiklander wrote:
>>
>> Hi Amirreza,
>>
>> On Fri, Mar 28, 2025 at 3:48 AM Amirreza Zarrabi
>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> For drivers that can transfer data to the TEE without using shared
>> memory from client, it is necessary to receive the user address
>> directly, bypassing any processing by the TEE subsystem. Introduce
>> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
>> userspace buffers.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>>  include/linux/tee_drv.h  |  6 ++++++
>>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>  3 files changed, 55 insertions(+), 6 deletions(-)
>>
>> Is this patch needed now that the QCOMTEE driver supports shared
>> memory? I prefer keeping changes to the ABI to a minimum.
>>
>> Cheers,
>> Jens
>>
>> Unfortunately, this is still required. QTEE supports two types of data transfer:
>> (1) using UBUF and (2) memory objects. Even with memory object support, some APIs still
>> expect to receive data using UBUF. For instance, to load a TA, QTEE offers two interfaces:
>> one where the TA binary is in UBUF and another where the TA binary is in a memory object.
> 
> Is this a limitation in the QTEE backend driver or on the secure side?
> Can it be fixed? I don't ask for changes in the ABI to the secure
> world since I assume you haven't made such changes while this patch
> set has evolved.
> 
> Cheers,
> Jens

The secure-side ABI supports passing data using memcpy to the same
buffer that contains the message for QTEE, rather than using a memory
object. Some services tend to use this approach for small data instead
of allocating a memory object. I have no choice but to expose this support.

Throughout the patchset, I have not made any change to the ABI but
tried to provide support for the memory object in a separate,
independent commit, distinct from the UBUF.

Best regards,
Amir

> 
>>
>> Best Regards,
>> Amir
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 22cc7d624b0c..bc862a11d437 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>                         params[n].u.value.b = ip.b;
>>                         params[n].u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       params[n].u.ubuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>> +                                      params[n].u.ubuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>                             put_user(p->u.value.c, &up->c))
>>                                 return -EFAULT;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
>> +                               return -EFAULT;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx,
>>                         ip.b = p->u.value.b;
>>                         ip.c = p->u.value.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       ip.a = (u64)p->u.ubuf.uaddr;
>> +                       ip.b = p->u.ubuf.size;
>> +                       ip.c = 0;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>                         p->u.value.b = ip.b;
>>                         p->u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       p->u.ubuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>> +                                      params[n].u.ubuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         /*
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index ce23fd42c5d4..d773f91c6bdd 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>         struct tee_shm *shm;
>>  };
>>
>> +struct tee_param_ubuf {
>> +       void * __user uaddr;
>> +       size_t size;
>> +};
>> +
>>  struct tee_param_value {
>>         u64 a;
>>         u64 b;
>> @@ -92,6 +97,7 @@ struct tee_param {
>>         u64 attr;
>>         union {
>>                 struct tee_param_memref memref;
>> +               struct tee_param_ubuf ubuf;
>>                 struct tee_param_value value;
>>         } u;
>>  };
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index d0430bee8292..3e9b1ec5dfde 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and output */
>>
>> +/*
>> + * These defines userspace buffer parameters.
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and output */
>> +
>>  /*
>>   * Mask for the type part of the attribute, leaves room for more types
>>   */
>> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>>  /**
>>   * struct tee_ioctl_param - parameter
>>   * @attr: attributes
>> - * @a: if a memref, offset into the shared memory object, else a value parameter
>> - * @b: if a memref, size of the buffer, else a value parameter
>> + * @a: if a memref, offset into the shared memory object,
>> + *     else if a ubuf, address of the user buffer,
>> + *     else a value parameter
>> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>>   * @c: if a memref, shared memory identifier, else a value parameter
>>   *
>> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
>> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
>> - * indicates that none of the members are used.
>> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
>> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>> + * are used.
>>   *
>>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>   * identifier representing the shared memory object. A memref can reference
>>
>> --
>> 2.34.1
>>


