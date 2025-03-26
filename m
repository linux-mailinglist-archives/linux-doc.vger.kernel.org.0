Return-Path: <linux-doc+bounces-41722-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38000A7144B
	for <lists+linux-doc@lfdr.de>; Wed, 26 Mar 2025 10:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37DFA3A6F01
	for <lists+linux-doc@lfdr.de>; Wed, 26 Mar 2025 09:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185AD1AE876;
	Wed, 26 Mar 2025 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZnsN2HD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43D41AF0D6
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742983071; cv=none; b=GYCHK6HmctM6YJMMF3+DMy04xeJ0f7ChRDC4kttmHJLf9L7abpfykah1KZJPahek2XdXIzFKrJ/ygBBFuH+MDf7Yrmd4u8jgbeYmA9Vge8UnE8OG9TYADpag1rROJu596YEPbwY2qlfOdPpBDosiaMpIo44cUrfOK6ndwgqEC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742983071; c=relaxed/simple;
	bh=Fz0vKdOQ3EjaYQnZrsYyzuylIwXBAcfiLb+7Mg11S2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEh8JTAjdgtYi73QkZ0GWJ2EphuKwi9dvEeZTc2vAdieDxfB8nOIhJhIZ43C0wxB2oIllznw5gfKFPEtllDRsJj8MiXTc1QDoG/Vf15dhXOgGZTp3+CVNad0lGlU2oRRMTktdZ8hTrQUhWx5nKNuSOQnm/1eKpvU3zRPPNwVLlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZnsN2HD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so10290681a12.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742983066; x=1743587866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I0w6V8xCOmfkr3XzwWeatuUXEgCBo6VUfxu4hbo5qyE=;
        b=GZnsN2HDCIfWFDL9ImDuM9UezPgVXphql/7VwxSzgh3VbgY9TPjQVjwDGBHRY3HF7M
         /JZTE7iIW3Y6AodwMaf/pL8yQJ0hkVH2KnL+nP8sT7N7Fr732KdP/yxOjgAHdNXQM2wf
         GQG5ueoW7Nm+1jkj1n/hEt2plSE0GUvqPRZArxgXnOHLPpetL1JGKMrI5/xxVeeDGba/
         X+FGanVFPY086uS+bT2tzjiF9icQ1I/OXdtftKFTfVYGe1Ymi0oFKwhfJXrdUhBi7Gih
         1CrU2KpvTMC/aXUfiZkeE5I8aE1QEbEhVsN97IC7FiN2bA88zbIZOYXiA9xdOHKKypLu
         gByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742983066; x=1743587866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0w6V8xCOmfkr3XzwWeatuUXEgCBo6VUfxu4hbo5qyE=;
        b=bePze2gPlc1ArKiQOXI7kY2MhseqxH97r99HWfYCfk4hR8vcB4d0+Yx2Fmg/k55IT4
         6U08haSQEDEsr0JMiw9dnzbrc3KRVwYnedV7kf5uo3pG7ZJbaiHndxUORTocqKt1ogKk
         yb7Z+b67xNm7zvzX8/qnnqVao9a28iuSj9aY3z+vrr89JZ03osMTXn8LHcFfH/JDG7Xq
         KFWmKZ56CN4ko2HjqC0Dd4fgfMWcxrVp/LlE7jkX0ICSeq0pLk83gI1IyoB+VvImNSa8
         BsG9nr2JP5cQXkF/Uc2GOeUQNuZ8sg2hwMmdTrSSe6URtqrLhLHSRO4M3o6oJ8lTi0PX
         aBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLl2LNEXMElqoGnjfNLZM4WyjQ9Y4LXKAHAjWrmVwsc08Hjq3Q7tEgXaTVhupfSIj2XW9Oayc+NvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxENvXFdDisBxktRzGJuAnqs6KEaci2/5HTjYJhM6qhTDQXzcbe
	8tVgrv6rK7nVwpdHGmw5DAhSV/zkSUkhL/pPVYIvV7cu5J5kyeCXJz2RxjuHTsQ=
X-Gm-Gg: ASbGncuPmJW70GJpYZzdYQAencZO2PWz/PDn0TTHcBp3TD5gpSEU8vSoxMwnAZbIn2i
	E+T9DJxx/JBbw9n5ci6JY3LqaACesZrGlshzYKFpruk1RUsVYo98EnU9t8bUupI7pTzcZrEHQN2
	7ZlG5LGknDKR2LyVSYV30yTW5exBMxLXST9ap82EOfwGWbvFO+qkBdcyQWqDXgXdQ9cUfyM5wIN
	molCYGWlM8eCxPbezqYvShAQ4x3CnPTdevq0/o/azrufshit3rgWw6IhNZrq79vPsTDDkkEWugf
	ztgIrd9oB3Bs3IfgApPc7EwX6izN98ab+f6t7rv3aZhOdjAeHDZOvl8=
X-Google-Smtp-Source: AGHT+IH2rmvcAI8FcPlP6I1oIyW+3AyHkz1Lr51ElEq1rUFCBXfV2rSEWOYq0KVDmLdunxsqUZs36w==
X-Received: by 2002:a05:6402:2397:b0:5ec:cbf9:420e with SMTP id 4fb4d7f45d1cf-5eccbf944f9mr6088692a12.20.1742983065714;
        Wed, 26 Mar 2025 02:57:45 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b2cf:5182:7604:e8d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0e0cb6sm8907978a12.79.2025.03.26.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:57:45 -0700 (PDT)
Date: Wed, 26 Mar 2025 10:57:41 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v36 22/31] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Message-ID: <Z-PPlRD7gcUcNvNv@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-23-quic_wcheng@quicinc.com>
 <Z-J2WnrZHP6iMIhT@linaro.org>
 <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>

On Tue, Mar 25, 2025 at 04:18:03PM -0700, Wesley Cheng wrote:
> On 3/25/2025 2:24 AM, Stephan Gerhold wrote:
> > On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
> >> The QC ADSP is able to support USB playback endpoints, so that the main
> >> application processor can be placed into lower CPU power modes.  This adds
> >> the required AFE port configurations and port start command to start an
> >> audio session.
> >>
> >> Specifically, the QC ADSP can support all potential endpoints that are
> >> exposed by the audio data interface.  This includes isochronous data
> >> endpoints, in either synchronous mode or asynchronous mode. In the latter
> >> case both implicit or explicit feedback endpoints are supported.  The size
> >> of audio samples sent per USB frame (microframe) will be adjusted based on
> >> information received on the feedback endpoint.
> >>
> >> Some pre-requisites are needed before issuing the AFE port start command,
> >> such as setting the USB AFE dev_token.  This carries information about the
> >> available USB SND cards and PCM devices that have been discovered on the
> >> USB bus.  The dev_token field is used by the audio DSP to notify the USB
> >> offload driver of which card and PCM index to enable playback on.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> ---
> >>  sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
> >>  sound/soc/qcom/qdsp6/q6afe.c             | 192 ++++++++++++++++++++++-
> >>  sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
> >>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
> >>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
> >>  sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
> >>  6 files changed, 341 insertions(+), 3 deletions(-)
> >>
> [...]
> >> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> >> index 90228699ba7d..b7439420b425 100644
> >> --- a/sound/soc/qcom/qdsp6/q6routing.c
> >> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> >> @@ -435,6 +435,26 @@ static struct session_data *get_session_from_id(struct msm_routing_data *data,
> >>  
> >>  	return NULL;
> >>  }
> >> +
> >> +static bool is_usb_routing_enabled(struct msm_routing_data *data)
> >> +{
> >> +	int i;
> >> +
> >> +	/*
> >> +	 * Loop through current sessions to see if there are active routes
> >> +	 * to the USB_RX backend DAI.  The USB offload routing is designed
> >> +	 * similarly to the non offload path.  If there are multiple PCM
> >> +	 * devices associated with the ASoC platform card, only one active
> >> +	 * path can be routed to the USB offloaded endpoint.
> >> +	 */
> >> +	for (i = 0; i < MAX_SESSIONS; i++) {
> >> +		if (data->sessions[i].port_id == USB_RX)
> >> +			return true;
> >> +	}
> >> +
> >> +	return false;
> >> +}
> > 
> > What is different about USB_RX compared to other output ports we have in
> > Q6AFE? Obviously, we can only play one stream on an output port. But
> > doesn't the ADSP mix streams together when you have multiple routes?
> > 
> 
> This patch will limit the USB_RX from being able to be mixed to multiple
> q6adm paths.
> 
> > Also, this doesn't actually check for *active* routes only. It just
> > looks if any other MultiMedia DAI is configured to output to USB_RX.
> > That doesn't mean they will ever be active at the same time.
> > 
> 
> Yes, the main reason being that that is the mechanism we use to populate
> the active offload path within the USB SND card mixer.
> 
> > I might for example want to have MultiMedia1 and MultiMedia2 both
> > configured to output to USB_RX. Let's assume MultiMedia1 is a normal PCM
> > DAI, MultiMedia2 is a compress offload DAI. When I want to playback
> > normal audio, I go through MultiMedia1, when I want to play compressed
> > audio, I go through MultiMedia2. Only one of them active at a time.
> > Why can't I set this up statically in the mixers?
> > 
> > If you confirm that it is really impossible to have multiple streams
> > mixed together to the USB_RX output in the ADSP, then this should be a
> > runtime check instead when starting the stream IMO.
> > 
> 
> We can have multiple streams being mixed together, but it will get
> confusing because it changes the definition that we had discussed about in
> the past about the overall design for the interaction w/ userspace.
> Although we (QC) only support a single USB audio device for offloading,
> there could be other situations where the audio DSP can support multiple
> devices.  The assumption is that each MM path is assigned to a USB device.
> 

Are you referring to the "USB Offload Playback Route PCM#*" mixers here?
They could just refer to first of the configured MM paths, if someone
decides to route multiple paths to the USB backend. Looking at
q6usb_update_offload_route(), I think the implementation does that
already.

I think it's fine that the userspace API for automatically "probing" the
PCM device supports only a single path to the USB backend. But if
someone wants to bypass the automatic probing and configure a more
advanced setup, do we need to forbid that?

Asked differently: what would happen if we remove this check here and
handle USB_RX like any other Q6AFE output port? Would anything break for
the userspace interface?

> [...]
> > 
> > Are you planning to send follow-up patches for USB recording offload
> > (USB_TX) later? Me and Luca successfully used your series to playback
> > voice call audio via the ADSP to an USB headset, recording would be also
> > needed to use this fully. :-)
> > 
> 
> Yes, I will follow up after getting the bulk of the changes for playback
> merged first.  The TX side changes should be minimal, and require only
> small updates.
> 

Thanks, sounds good!

Stephan

