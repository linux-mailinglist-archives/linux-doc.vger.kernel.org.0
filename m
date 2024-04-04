Return-Path: <linux-doc+bounces-13499-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55765898CD3
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 18:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09EA628A7F3
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 16:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3613312AAE8;
	Thu,  4 Apr 2024 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="qF7MM0hr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996FE129E8A
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712249969; cv=none; b=KC8oH59iek6KU+mWwOH6zu1bbPsAg8oZkpcTUEZBI1I1DoLCZMap1q0Wxq689gfgHvUQ4qwY/SvXiegANoOOM/8nJkZrY9cuSSRCwYTwiHdur6TC/tsgKKztY9Ik1leGAyjVG7Vksk2igrTCLhyTheRey8cpoc7bYKDLB+PICT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712249969; c=relaxed/simple;
	bh=h/yAr58Hu/jQ+43G5QKW4mbHitUdKpYi85FbtxDyPtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pk29ARlmwDmn44+j1yS8JIHJbrUUYoo7Hx/SE/ZeiS7jtJ7sg0vMqWQ3EaJrhz1d+Pk+iyQsT+w/ffvueJo0Dw8+YLm+j3iUZtechq7KGd0yfE4PV3UUMFc7RqvehL/tNhVHrd3mHItqJWWCtswmfZNV0UYMbOMmBLNlLudoey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=qF7MM0hr; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e782e955adso1125484b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1712249967; x=1712854767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJr84XjfBmPBwvPymABahYlh6NYQegAHMHrvORFI3xg=;
        b=qF7MM0hrb4v5PBP01godZOiqevndoLCsaBXI4mQe0y9Np8aCgrp9H2aIpQOLkkeHSA
         thvAXgo8+fP7i/KV4/Iz3Ggo+P2qaqxU++Kxv0S0MQOm6LlMr4ONlChCFEK20LfGkZnp
         uKKcHNgy2AaoWpg9xpm8BxqL3fgAEp7OYHsLm7C3cxedhcTzEf7RHJx7QCMJg+WugPBz
         xMk/a698xQ6ADXnkM2YSMwz+ql7jfjCNxf97c/p/Tl62fS1P+7wfDpv5ywQjFQk8+l+D
         1PTW9NmSIVnRGd7uhxbI2zZPuS/glGt90sYXyuSsDJNQwowvpSJsxdUg55JIGIBq25jx
         XfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712249967; x=1712854767;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJr84XjfBmPBwvPymABahYlh6NYQegAHMHrvORFI3xg=;
        b=R6/tbllTGM3XR52LkOAOj7fa7CnFhx5PkfjJw+f+DRw7WEMxhwHw4G+Gd/7V4EPOhR
         UYul8qLikNultoK86mhKo/9AyasA2vQfgnOI18zF6D98tGVP7UXH3R0xbbr3o/FC0/r7
         rUYd/TkQsG3/MseDhvmAfdaqATL8dOuvTte7D9ANhnnKpB21io2r7yUIpD3rjtmCqlIe
         K5O+/i5DeTCS2Wn/Wy4acbcPpESmb8Jc5SlTy9AAsh1W4S12keiSnh7L2OEwdQN1Afm6
         9gZjbqogyxigzOWY4tg3IxbcRzPeMY/L+/xh2xlmeJvThrz8XU2noUU/lOVjKONsXtkN
         7F9g==
X-Forwarded-Encrypted: i=1; AJvYcCWTc7h6jAjcxbXh0yLWe9d0vkDRBwcwNhOXMueQ6is2iaKRCQYrT3uqeFd+ViFHb/AJTZwQHIvjknerAghdy+WoiaKqXgZ+7cIz
X-Gm-Message-State: AOJu0YzueO/mKTrGIQSJ5H9z0AC11rKCmjXyG4l5FJa51fttuB1G6Qav
	N1rJQQy6v3FXBIkqGsMDhqbUis8SGXQKUwQ5DGPmtzcrqVyjgyxwwAIIrRVBvxo=
X-Google-Smtp-Source: AGHT+IHlH4PlA37LqwgRtkkdxugh8Zt62rpSnhntfvUGmJ0lvoqm1sB7cUCV3OBlJ6CfhpnhJn0Aig==
X-Received: by 2002:a05:6a00:23c9:b0:6ea:afcb:1b4a with SMTP id g9-20020a056a0023c900b006eaafcb1b4amr3507333pfc.8.1712249966693;
        Thu, 04 Apr 2024 09:59:26 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881? ([2620:10d:c090:500::6:6984])
        by smtp.gmail.com with ESMTPSA id ls30-20020a056a00741e00b006e6c733bde9sm13958882pfb.155.2024.04.04.09.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 09:59:26 -0700 (PDT)
Message-ID: <b6f1dc7a-4548-42df-99ae-596dff525226@davidwei.uk>
Date: Thu, 4 Apr 2024 09:59:23 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v3 1/2] devlink: Support setting max_io_eqs
Content-Language: en-GB
To: Parav Pandit <parav@nvidia.com>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, corbet@lwn.net, kalesh-anakkur.purayil@broadcom.com
Cc: saeedm@nvidia.com, leon@kernel.org, jiri@resnulli.us, shayd@nvidia.com,
 danielj@nvidia.com, dchumak@nvidia.com, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Jiri Pirko <jiri@nvidia.com>
References: <20240403174133.37587-1-parav@nvidia.com>
 <20240403174133.37587-2-parav@nvidia.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240403174133.37587-2-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-04-03 10:41, Parav Pandit wrote:
> Many devices send event notifications for the IO queues,
> such as tx and rx queues, through event queues.
> 
> Enable a privileged owner, such as a hypervisor PF, to set the number
> of IO event queues for the VF and SF during the provisioning stage.
> 
> example:
> Get maximum IO event queues of the VF device::
> 
>   $ devlink port show pci/0000:06:00.0/2
>   pci/0000:06:00.0/2: type eth netdev enp6s0pf0vf1 flavour pcivf pfnum 0 vfnum 1
>       function:
>           hw_addr 00:00:00:00:00:00 ipsec_packet disabled max_io_eqs 10
> 
> Set maximum IO event queues of the VF device::
> 
>   $ devlink port function set pci/0000:06:00.0/2 max_io_eqs 32
> 
>   $ devlink port show pci/0000:06:00.0/2
>   pci/0000:06:00.0/2: type eth netdev enp6s0pf0vf1 flavour pcivf pfnum 0 vfnum 1
>       function:
>           hw_addr 00:00:00:00:00:00 ipsec_packet disabled max_io_eqs 32
> 
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Reviewed-by: Shay Drory <shayd@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v2->v3:
> - limited 80 chars per line
> v1->v2:
> - limited comment to 80 chars per line in header file
> ---
>  .../networking/devlink/devlink-port.rst       | 25 +++++++++
>  include/net/devlink.h                         | 14 +++++
>  include/uapi/linux/devlink.h                  |  1 +
>  net/devlink/port.c                            | 53 +++++++++++++++++++
>  4 files changed, 93 insertions(+)
> 
> diff --git a/Documentation/networking/devlink/devlink-port.rst b/Documentation/networking/devlink/devlink-port.rst
> index 562f46b41274..451f57393f11 100644
> --- a/Documentation/networking/devlink/devlink-port.rst
> +++ b/Documentation/networking/devlink/devlink-port.rst
> @@ -134,6 +134,9 @@ Users may also set the IPsec crypto capability of the function using
>  Users may also set the IPsec packet capability of the function using
>  `devlink port function set ipsec_packet` command.
>  
> +Users may also set the maximum IO event queues of the function
> +using `devlink port function set max_io_eqs` command.
> +
>  Function attributes
>  ===================
>  
> @@ -295,6 +298,28 @@ policy is processed in software by the kernel.
>          function:
>              hw_addr 00:00:00:00:00:00 ipsec_packet enabled
>  
> +Maximum IO events queues setup
> +------------------------------
> +When user sets maximum number of IO event queues for a SF or
> +a VF, such function driver is limited to consume only enforced
> +number of IO event queues.
> +
> +- Get maximum IO event queues of the VF device::
> +
> +    $ devlink port show pci/0000:06:00.0/2
> +    pci/0000:06:00.0/2: type eth netdev enp6s0pf0vf1 flavour pcivf pfnum 0 vfnum 1
> +        function:
> +            hw_addr 00:00:00:00:00:00 ipsec_packet disabled max_io_eqs 10
> +
> +- Set maximum IO event queues of the VF device::
> +
> +    $ devlink port function set pci/0000:06:00.0/2 max_io_eqs 32
> +
> +    $ devlink port show pci/0000:06:00.0/2
> +    pci/0000:06:00.0/2: type eth netdev enp6s0pf0vf1 flavour pcivf pfnum 0 vfnum 1
> +        function:
> +            hw_addr 00:00:00:00:00:00 ipsec_packet disabled max_io_eqs 32
> +
>  Subfunction
>  ============
>  
> diff --git a/include/net/devlink.h b/include/net/devlink.h
> index 9ac394bdfbe4..bb1af599d101 100644
> --- a/include/net/devlink.h
> +++ b/include/net/devlink.h
> @@ -1602,6 +1602,14 @@ void devlink_free(struct devlink *devlink);
>   *			      capability. Should be used by device drivers to
>   *			      enable/disable ipsec_packet capability of a
>   *			      function managed by the devlink port.
> + * @port_fn_max_io_eqs_get: Callback used to get port function's maximum number
> + *			    of event queues. Should be used by device drivers to
> + *			    report the maximum event queues of a function
> + *			    managed by the devlink port.
> + * @port_fn_max_io_eqs_set: Callback used to set port function's maximum number
> + *			    of event queues. Should be used by device drivers to
> + *			    configure maximum number of event queues
> + *			    of a function managed by the devlink port.
>   *
>   * Note: Driver should return -EOPNOTSUPP if it doesn't support
>   * port function (@port_fn_*) handling for a particular port.
> @@ -1651,6 +1659,12 @@ struct devlink_port_ops {
>  	int (*port_fn_ipsec_packet_set)(struct devlink_port *devlink_port,
>  					bool enable,
>  					struct netlink_ext_ack *extack);
> +	int (*port_fn_max_io_eqs_get)(struct devlink_port *devlink_port,
> +				      u32 *max_eqs,
> +				      struct netlink_ext_ack *extack);
> +	int (*port_fn_max_io_eqs_set)(struct devlink_port *devlink_port,
> +				      u32 max_eqs,
> +				      struct netlink_ext_ack *extack);
>  };
>  
>  void devlink_port_init(struct devlink *devlink,
> diff --git a/include/uapi/linux/devlink.h b/include/uapi/linux/devlink.h
> index 2da0c7eb6710..9401aa343673 100644
> --- a/include/uapi/linux/devlink.h
> +++ b/include/uapi/linux/devlink.h
> @@ -686,6 +686,7 @@ enum devlink_port_function_attr {
>  	DEVLINK_PORT_FN_ATTR_OPSTATE,	/* u8 */
>  	DEVLINK_PORT_FN_ATTR_CAPS,	/* bitfield32 */
>  	DEVLINK_PORT_FN_ATTR_DEVLINK,	/* nested */
> +	DEVLINK_PORT_FN_ATTR_MAX_IO_EQS,	/* u32 */
>  
>  	__DEVLINK_PORT_FUNCTION_ATTR_MAX,
>  	DEVLINK_PORT_FUNCTION_ATTR_MAX = __DEVLINK_PORT_FUNCTION_ATTR_MAX - 1
> diff --git a/net/devlink/port.c b/net/devlink/port.c
> index 118d130d2afd..be9158b4453c 100644
> --- a/net/devlink/port.c
> +++ b/net/devlink/port.c
> @@ -16,6 +16,7 @@ static const struct nla_policy devlink_function_nl_policy[DEVLINK_PORT_FUNCTION_
>  				 DEVLINK_PORT_FN_STATE_ACTIVE),
>  	[DEVLINK_PORT_FN_ATTR_CAPS] =
>  		NLA_POLICY_BITFIELD32(DEVLINK_PORT_FN_CAPS_VALID_MASK),
> +	[DEVLINK_PORT_FN_ATTR_MAX_IO_EQS] = { .type = NLA_U32 },
>  };
>  
>  #define ASSERT_DEVLINK_PORT_REGISTERED(devlink_port)				\
> @@ -182,6 +183,30 @@ static int devlink_port_fn_caps_fill(struct devlink_port *devlink_port,
>  	return 0;
>  }
>  
> +static int devlink_port_fn_max_io_eqs_fill(struct devlink_port *port,
> +					   struct sk_buff *msg,
> +					   struct netlink_ext_ack *extack,
> +					   bool *msg_updated)
> +{
> +	u32 max_io_eqs;
> +	int err;
> +
> +	if (!port->ops->port_fn_max_io_eqs_get)
> +		return 0;
> +
> +	err = port->ops->port_fn_max_io_eqs_get(port, &max_io_eqs, extack);
> +	if (err) {
> +		if (err == -EOPNOTSUPP)
> +			return 0;

Docs above says:
   * Note: Driver should return -EOPNOTSUPP if it doesn't support
   * port function (@port_fn_*) handling for a particular port.

But here you're returning 0 in both cases of no port_fn_max_io_eqs_get
or port_fn_max_io_eqs_get() returns EOPNOTSUPP.

> +		return err;
> +	}
> +	err = nla_put_u32(msg, DEVLINK_PORT_FN_ATTR_MAX_IO_EQS, max_io_eqs);
> +	if (err)
> +		return err;
> +	*msg_updated = true;
> +	return 0;
> +}
> +
>  int devlink_nl_port_handle_fill(struct sk_buff *msg, struct devlink_port *devlink_port)
>  {
>  	if (devlink_nl_put_handle(msg, devlink_port->devlink))
> @@ -409,6 +434,18 @@ static int devlink_port_fn_caps_set(struct devlink_port *devlink_port,
>  	return 0;
>  }
>  
> +static int
> +devlink_port_fn_max_io_eqs_set(struct devlink_port *devlink_port,
> +			       const struct nlattr *attr,
> +			       struct netlink_ext_ack *extack)
> +{
> +	u32 max_io_eqs;
> +
> +	max_io_eqs = nla_get_u32(attr);
> +	return devlink_port->ops->port_fn_max_io_eqs_set(devlink_port,
> +							 max_io_eqs, extack);
> +}
> +
>  static int
>  devlink_nl_port_function_attrs_put(struct sk_buff *msg, struct devlink_port *port,
>  				   struct netlink_ext_ack *extack)
> @@ -428,6 +465,9 @@ devlink_nl_port_function_attrs_put(struct sk_buff *msg, struct devlink_port *por
>  	if (err)
>  		goto out;
>  	err = devlink_port_fn_state_fill(port, msg, extack, &msg_updated);
> +	if (err)
> +		goto out;
> +	err = devlink_port_fn_max_io_eqs_fill(port, msg, extack, &msg_updated);
>  	if (err)
>  		goto out;
>  	err = devlink_rel_devlink_handle_put(msg, port->devlink,
> @@ -726,6 +766,12 @@ static int devlink_port_function_validate(struct devlink_port *devlink_port,
>  			}
>  		}
>  	}
> +	if (tb[DEVLINK_PORT_FN_ATTR_MAX_IO_EQS] &&
> +	    !ops->port_fn_max_io_eqs_set) {
> +		NL_SET_ERR_MSG_ATTR(extack, tb[DEVLINK_PORT_FN_ATTR_MAX_IO_EQS],
> +				    "Function does not support max_io_eqs setting");
> +		return -EOPNOTSUPP;
> +	}
>  	return 0;
>  }
>  
> @@ -761,6 +807,13 @@ static int devlink_port_function_set(struct devlink_port *port,
>  			return err;
>  	}
>  
> +	attr = tb[DEVLINK_PORT_FN_ATTR_MAX_IO_EQS];
> +	if (attr) {
> +		err = devlink_port_fn_max_io_eqs_set(port, attr, extack);
> +		if (err)
> +			return err;
> +	}
> +
>  	/* Keep this as the last function attribute set, so that when
>  	 * multiple port function attributes are set along with state,
>  	 * Those can be applied first before activating the state.

