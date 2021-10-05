Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24DF422DEA
	for <lists+linux-doc@lfdr.de>; Tue,  5 Oct 2021 18:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbhJEQ2G (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Oct 2021 12:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbhJEQ2G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 12:28:06 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B457C061753
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 09:26:15 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id x124so26938428oix.9
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8FXEoaPuSjmYoE44Oy8m4nN5N37CAdgGF5w9YsNL5XM=;
        b=AaD6XS/7fj5QAtYuDKc2BsZu97Uset633WpxM3qa0/m8Ces9bSTUEn7MYvS5CJpzX1
         JwybKgBe950zI6Pe9QhYWF8z76dK2imnAyroQ4OMKd+z1V4ruubXHXHAJ57iqXSDlV3V
         lc5xzevZNI4AHlZEf9F+YaBWT+QF5a7ij1QvjWWqY8wsY1rY8rTSw4kKBzY4fyqJIbQA
         oI9JgehKTy1PFikO3iQ/0WrOa/Q/2yCOIlpYkYB1ruqI1CfbX/0FC7KycJ7rkN6qgA36
         E15gVNxNY699HZn390A4/IEq+3px2ox4rlEGeD7XDjadmkEmyGqPO56U2bQ5k5LCsp4Q
         Bd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8FXEoaPuSjmYoE44Oy8m4nN5N37CAdgGF5w9YsNL5XM=;
        b=PrnmXtriIPTGCj+2i5t8aetBZvOrymwEtzLSwSf6tmuM0akrpxFY9jM/TpHphQ/uzy
         eSEXy3cVcdBE8LQrPIzEaqTbsYPTBwpdQho3eRbAevt0KE/4Lzct7SI74jdFRBFGa7Nj
         yQayGIDP+I7tbIA9h25q1kwhti3rXHaFz2AEmdmQBKEci4f09Dpv0TElIs5fcnomloN8
         +fNzWs0kInLOpvBD9blqb5XCO5t/KWgUtUVRS7u1F7JVD3CZMU6sLGev/DAPF7f7+/aH
         +Mnv0pr/5t0TcTzK9B7LNAUltorWSNMjnWdAsJ3SWx4wHZXYe8gz98bzopFqgb2thP8x
         MAAQ==
X-Gm-Message-State: AOAM532kAM2oWmATx6iY6X8mmq04UgEQ4mwEUdbKGBQa+hrzHcT871g7
        n8pceZsP0Fr1Bx0RXiXb95sldBU4aActlQ==
X-Google-Smtp-Source: ABdhPJy/XeVqid/7dcxYSksdL2f1Y0ro1GG40qMnqWBRMkVeNftGqE/gyc6WmTdwdpqZYaxYQpLRhw==
X-Received: by 2002:a05:6808:178c:: with SMTP id bg12mr3429148oib.157.1633451174904;
        Tue, 05 Oct 2021 09:26:14 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id y12sm3489926otu.11.2021.10.05.09.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:26:14 -0700 (PDT)
Date:   Tue, 5 Oct 2021 09:27:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Suman Anna <s-anna@ti.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v8 1/2] rpmsg: core: add API to get MTU
Message-ID: <YVx9DG/HYCEVJ6wv@ripper>
References: <20210930160520.19678-1-arnaud.pouliquen@foss.st.com>
 <20210930160520.19678-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930160520.19678-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu 30 Sep 09:05 PDT 2021, Arnaud Pouliquen wrote:

> Return the rpmsg buffer MTU for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Acked-by: Suman Anna <s-anna@ti.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  include/linux/rpmsg.h            | 10 ++++++++++
>  4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 9151836190ce..fb955a79462b 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -327,6 +327,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>  
> +/**
> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
> + * @ept: the rpmsg endpoint
> + *
> + * This function returns maximum buffer size available for a single message.

Nit. Can we add "outgoing" between "single" and "message" here?


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> + *
> + * Return: the maximum transmission size on success and an appropriate error
> + * value on failure.
> + */
> +
> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->get_mtu)
> +		return -ENOTSUPP;
> +
> +	return ept->ops->get_mtu(ept);
> +}
> +EXPORT_SYMBOL(rpmsg_get_mtu);
> +
>  /*
>   * match a rpmsg channel with a channel info struct.
>   * this is used to make sure we're not creating rpmsg devices for channels
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..b1245d3ed7c6 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -53,6 +53,7 @@ struct rpmsg_device_ops {
>   * @trysendto:		see @rpmsg_trysendto(), optional
>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>   * @poll:		see @rpmsg_poll(), optional
> + * @get_mtu:		see @rpmsg_get_mtu(), optional
>   *
>   * Indirection table for the operations that a rpmsg backend should implement.
>   * In addition to @destroy_ept, the backend must at least implement @send and
> @@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
>  			     void *data, int len);
>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>  			     poll_table *wait);
> +	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
>  };
>  
>  struct device *rpmsg_find_device(struct device *parent,
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8e49a3bacfc7..05fd06fc67e9 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -149,6 +149,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>  				  int len, u32 dst);
>  static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>  					   u32 dst, void *data, int len);
> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>  static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
>  						   struct rpmsg_channel_info *chinfo);
>  
> @@ -160,6 +161,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>  	.trysend = virtio_rpmsg_trysend,
>  	.trysendto = virtio_rpmsg_trysendto,
>  	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
> +	.get_mtu = virtio_rpmsg_get_mtu,
>  };
>  
>  /**
> @@ -696,6 +698,14 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>  }
>  
> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	struct rpmsg_device *rpdev = ept->rpdev;
> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> +
> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> +}
> +
>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  			     struct rpmsg_hdr *msg, unsigned int len)
>  {
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index d97dcd049f18..990b80fb49ad 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  			poll_table *wait);
>  
> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
> +
>  #else
>  
>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> @@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  	return 0;
>  }
>  
> +static inline ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>  
>  /* use a macro to avoid include chaining to get THIS_MODULE */
> -- 
> 2.17.1
> 
