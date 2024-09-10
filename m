Return-Path: <linux-doc+bounces-24943-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC79744E5
	for <lists+linux-doc@lfdr.de>; Tue, 10 Sep 2024 23:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21C4B1F2674E
	for <lists+linux-doc@lfdr.de>; Tue, 10 Sep 2024 21:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EC91AAE39;
	Tue, 10 Sep 2024 21:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JKKEHfgP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46304190047;
	Tue, 10 Sep 2024 21:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726004079; cv=none; b=XP0lAu/LoJ7Kl8ydFMUkAPCnQaL3EoUNUAucMjS+nNnc/adzVS61kY/2j8QTeEEWSIYNuK/hIB5+Mf6e4dAO3rSL+qJLfiaekDXiD6giMqVa2V2aQfiXL9JWzcELxBUvtc0eaJBf7rV0hNE1rOdhnTDCtaRo5QSrXSIHKgrTvH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726004079; c=relaxed/simple;
	bh=8dKrQCYR0WC+9SlNLSyJzhHsUpR3AVHh9Uzy+jyf3lM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbx1qFBBv9ihzrgKxEyYF+OJwP9/XffUWpFKyijeCggIaFI1NVnL+jX3vhcxuamMTQYk8tdKIj4dFsK3VOBmAF0ErexDqSOKYDWjEMmFrVAmcS9UeQUC44qUBUVSszI2l+h7a8hSnBxljhj6cvvAjXr1CpLrsG5gOtslz6L9N6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JKKEHfgP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AFAGOW020308;
	Tue, 10 Sep 2024 21:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/8YvRtEGh/rrd/XSJPHpbJwX
	vwaw+cSYdAjRpmZdS8I=; b=JKKEHfgP3Q1Jqn6S5q3agtg/IfkQzfZtyFPvK/ni
	s34GefNv8GVNx+D0MAdfXEjDjwtIaF1GwrXHcIYi2426wUOWMq8basvfl4YMswx4
	hCICETA7wY22eCG7VpjL7OgUc7/y715YQwNdzPc8A5oTBM+IpLB68x8zb07kxwPL
	km/dcIRHjC7kS0MpyksP9s8lvMzvjOdgZIjYKBIP28YlejsR2QgBoiuzhCsF77Qm
	WDRUj87QCjv6BiU4xCTOXTBn2pDvjAW5WId2ouulfEp5fuhZc7GUMsQtgobZvz+t
	s+IhhrOOzWL7mUEdD7FxFOwCqGkOwsibcJXsndvgylRLoA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5dxn11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 21:34:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ALYLYm010958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 21:34:21 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 14:34:16 -0700
Date: Wed, 11 Sep 2024 03:04:12 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Antonino Maniscalco <antomani103@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 06/10] drm/msm/A6xx: Use posamble to reset counters on
 preemption
Message-ID: <20240910213412.xfw6abex5aqp7b66@hu-akhilpo-hyd.qualcomm.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-6-fd947699f7bc@gmail.com>
 <20240906200847.ajcrpikzl65fwbjz@hu-akhilpo-hyd.qualcomm.com>
 <69efbf90-7ce1-429f-bf3a-d19acd7d649d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <69efbf90-7ce1-429f-bf3a-d19acd7d649d@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -LsNJKvZl1vFyAp3lzcqKu6XdHnPxM5V
X-Proofpoint-GUID: -LsNJKvZl1vFyAp3lzcqKu6XdHnPxM5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100161

On Mon, Sep 09, 2024 at 05:07:42PM +0200, Antonino Maniscalco wrote:
> On 9/6/24 10:08 PM, Akhil P Oommen wrote:
> > On Thu, Sep 05, 2024 at 04:51:24PM +0200, Antonino Maniscalco wrote:
> > > Use the postamble to reset perf counters when switching between rings,
> > > except when sysprof is enabled, analogously to how they are reset
> > > between submissions when switching pagetables.
> > > 
> > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 20 ++++++++++++++++++-
> > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  5 +++++
> > >   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
> > >   4 files changed, 61 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index ed0b138a2d66..710ec3ce2923 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> > >   static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
> > >   		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
> > >   {
> > > -	u64 preempt_offset_priv_secure;
> > > +	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
> > > +	u64 preempt_offset_priv_secure, preempt_postamble;
> > >   	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
> > > @@ -398,6 +399,23 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
> > >   	/* seems OK to set to 0 to disable it */
> > >   	OUT_RING(ring, 0);
> > >   	OUT_RING(ring, 0);
> > > +
> > > +	/* if not profiling set postamble to clear perfcounters, else clear it */
> > > +	if (!sysprof && a6xx_gpu->preempt_postamble_len) {

Setting len = 0 is enough to skip processing postamble packets. So how
about a simpler:

len = a6xx_gpu->preempt_postamble_len;
if (sysprof)
	len = 0;

OUT_PKT7(ring, CP_SET_AMBLE, 3);
OUT_RING(ring, lower_32_bits(preempt_postamble));
OUT_RING(ring, upper_32_bits(preempt_postamble));
OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(len) |
		CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));

> > > +		preempt_postamble = a6xx_gpu->preempt_postamble_iova;
> > > +
> > > +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
> > > +		OUT_RING(ring, lower_32_bits(preempt_postamble));
> > > +		OUT_RING(ring, upper_32_bits(preempt_postamble));
> > > +		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
> > > +					a6xx_gpu->preempt_postamble_len) |
> > > +				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> > > +	} else {
> > 
> > Why do we need this else part?
> 
> Wouldn't the postmable remain set if we don't explicitly set it to 0?

Aah, that is a genuine concern. I am not sure! Lets keep it.

> 
> > 
> > > +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
> > > +		OUT_RING(ring, 0);
> > > +		OUT_RING(ring, 0);
> > > +		OUT_RING(ring, CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> > > +	}
> > >   }
> > >   static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > index da10060e38dc..b009732c08c5 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > @@ -71,6 +71,11 @@ struct a6xx_gpu {
> > >   	bool uses_gmem;
> > >   	bool skip_save_restore;
> > > +	struct drm_gem_object *preempt_postamble_bo;
> > > +	void *preempt_postamble_ptr;
> > > +	uint64_t preempt_postamble_iova;
> > > +	uint64_t preempt_postamble_len;
> > > +
> > >   	struct a6xx_gmu gmu;
> > >   	struct drm_gem_object *shadow_bo;
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> > > index 1caff76aca6e..ec44f44d925f 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> > > @@ -346,6 +346,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
> > >   	return 0;
> > >   }
> > > +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
> > > +{
> > > +	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
> > > +	u32 count = 0;
> > > +
> > > +	postamble[count++] = PKT7(CP_REG_RMW, 3);
> > > +	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
> > > +	postamble[count++] = 0;
> > > +	postamble[count++] = 1;
> > > +
> > > +	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
> > > +	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
> > > +	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> > > +				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> > > +	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
> > > +	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
> > > +	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
> > > +	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> > 
> > Isn't it better to just replace this with NOP packets when sysprof is
> > enabled, just before triggering preemption? It will help to have an
> > immediate effect.
> > 
> > -Akhil
> > 
> 
> Mmm, this being a postamble I wonder whether we have the guarantee that it
> finishes execution before the IRQ is called so updating it doesn't race with
> the CP executing it.

Yes, it will be complete. But on a second thought now, this suggestion from me
looks like an overkill.

-Akhil.

> 
> > > +
> > > +	a6xx_gpu->preempt_postamble_len = count;
> > > +}
> > > +
> > >   void a6xx_preempt_fini(struct msm_gpu *gpu)
> > >   {
> > >   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > @@ -376,6 +398,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
> > >   	a6xx_gpu->uses_gmem = 1;
> > >   	a6xx_gpu->skip_save_restore = 1;
> > > +	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
> > > +			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
> > > +			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
> > > +			&a6xx_gpu->preempt_postamble_iova);
> > > +
> > > +	preempt_prepare_postamble(a6xx_gpu);
> > > +
> > > +	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
> > > +		goto fail;
> > > +
> > >   	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
> > >   	return;
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > index 6b1888280a83..87098567483b 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
> > >   	OUT_RING(ring, PKT4(regindx, cnt));
> > >   }
> > > +#define PKT7(opcode, cnt) \
> > > +	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
> > > +		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
> > > +
> > >   static inline void
> > >   OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
> > >   {
> > >   	adreno_wait_ring(ring, cnt + 1);
> > > -	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
> > > -		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
> > > +	OUT_RING(ring, PKT7(opcode, cnt));
> > >   }
> > >   struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
> > > 
> > > -- 
> > > 2.46.0
> > > 
> 
> Best regards,
> -- 
> Antonino Maniscalco <antomani103@gmail.com>
> 

