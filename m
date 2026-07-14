Return-Path: <linux-doc+bounces-96743-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IgYBFJMzVmpE1QAAu9opvQ
	(envelope-from <linux-doc+bounces-96743-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:03:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CAE754CF7
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:03:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.s=20251104 header.b=sNKcInuH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96743-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96743-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEC7A301F9EA
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5694508F8;
	Tue, 14 Jul 2026 12:58:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69F14483BA
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 12:58:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033920; cv=none; b=Me13uSLuvLlbzFeEX7jdWcMYB/ZkYiQU5loLEo2/Wp3cjOl5FkN7BMDEGRZ/n9tjq+DPLE1jhh4A/fW1rrV75fzIbyfsSi3/swQraHqVWx6j2NW9Q89jtpJDSSs5fhwkvCEXeMBdEqmqLqi1yqmaNitZfttKwtxaDPlk9TqwdhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033920; c=relaxed/simple;
	bh=zodWS7rv1aDgcuPkzbqACdUmH3WWZLSmb9HJQdCdNTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XT6cqC7R0Hc6K9OrCiMcd8B1KsDLqsmyupr4Py9WOIT6wRQ/Ma1NRPGOa+XgoIe/QcH7y6Hh53I1RnOEV35MIzQK5xTR61TxkJZFsteYFD9mL2vnrdIsSuCgYfiEZr9f72QyYhsqe9UrE4FzCaK4cCsq2pX9U2VUnCUCkweyjrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=sNKcInuH; arc=none smtp.client-ip=209.85.208.178
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39b22d0e488so48571331fa.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 05:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784033915; x=1784638715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LFB0TEAvMFCr6jHr2OUldXZ9xrpx3f7gJBKNTJaTmYM=;
        b=sNKcInuHSrzfnMZNWQ7jrzoaZYi7udGugtrUx7kAsLngaOINg4VMEz3QZm59ETPbkP
         G4jN3WG+zF2WKM1WJorX93KPeO5lt8meIqO4NNWYOo3lCdd3mHIjXdcKARocpNw9idmr
         gAp0RvZm51j+xsHH40AQFHPKKspveEPQc4sdZNZmpzJHS73PCY84qFWZ6h6xLa17Xhav
         CMFcDyJ77ivh4UFHEMsxejeF5eMN+pDSE6RLHFfWmhrZxc6d17bH+yOO4jJ97TSqPs0G
         9je/EXDV6Z7qcoAO+qHNXV8va1Quo2xfiv46DWiM14VrmC8bBH++KdyBALOPqRGh6lw0
         0KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784033915; x=1784638715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFB0TEAvMFCr6jHr2OUldXZ9xrpx3f7gJBKNTJaTmYM=;
        b=gIIPcOGWaCGYNUarSjdeW6j+0hmgkR1re0H1lnp2P2jOEz0SR/sybD5N2CDDEw/vz7
         LtnwqBK73P3AIj+aJJr5q7uRQnOU7T4htJAGYthoOK8PPWc/iEggy5lzmyWw3pYjQqAr
         nOy/NQI1P9A6OpiP0wSeAYbjUfC1D/fHvLFZ4ozxnsHl1kx9ObMJSgbDJMm2dE80rtnZ
         6vu52IKezHYsu31c515GT7ukyn31xAashjkw4hPwCPPGDN+NPuEFtn1WvAKeNmMBgZIn
         zAVCweIVfHGe0h/pGrxqY8gMmQlwQteHsmWOGuaA+Q2zoPEL1CC7aaCp3JVcyTlBuoeM
         lilw==
X-Forwarded-Encrypted: i=1; AHgh+Roeh8IoJFSqzzZsW0gRBOVc+h9yq4FeJJ9nh7kP6hAKKHqAZ0/Rx7NcDeQAC6VMW/uNcI1m4sUfJbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf08neiyyl+04GBrSk4nV3vwAkePgfwJTnHxXvxGpEBux0LiC7
	WE46A2Iq06KDfzRkRQek6Ni0+CnNGjVlA9uqC/V3fGksJIO0rVDw+9Oyr7Mnlv8NSoI=
X-Gm-Gg: AfdE7cnpWFrBZPvJrgyN/VrsE53yPD1ezlK9vvHcBnZiyLdE5LkDHN8VE4wwqXiLDjP
	nef310PR822YZp1ashRWeVFzNdALvXizHaEUvACPhT2+kPazvbg3+PHRxaqcYcd/B2cCVc1x6f5
	DyFED4Rg3XYs3Kqs/eOhDHz7LuhA1JdpAFOFsQ0rdvnS79UijcxKCqWjAS1suBoDX8T6nBITgxt
	pcaUmrZxU/lLp/qOexlm48s5AuqVCgcu5z9pPP1JSdICQJ+kbFAgzTI59Iv42ozDQT8Ci15EBNT
	xpJH459lSc9tQmE33btuQPPH5Z85gJsrWOIpsSJhE32pvrZis5cMTTc8T5LgYqz2Pz6+c9fF3CT
	XriN51LGiCrtXgZEj/Tq60HqugZMZx1arU6vT4suwSMkwVtaGrb8pSUlaPEI+lIwdPxjpW98VCS
	Q3aUY+WKtk1fnQFXVMM3WBIY0=
X-Received: by 2002:a05:6512:8395:b0:5b0:1760:fabe with SMTP id 2adb3069b0e04-5b0236651e9mr1956976e87.15.1784033914770;
        Tue, 14 Jul 2026 05:58:34 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa66cbsm3482896e87.61.2026.07.14.05.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:58:34 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:58:30 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next V6 3/4] devlink: Parse eswitch mode boot defaults
Message-ID: <alYycEavj752bHjD@FV6GYCPJ69>
References: <20260714061731.531849-1-mbloch@nvidia.com>
 <20260714061731.531849-4-mbloch@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714061731.531849-4-mbloch@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96743-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mbloch@nvidia.com,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:saeedm@nvidia.com,m:leon@kernel.org,m:tariqt@nvidia.com,m:andrew+netdev@lunn.ch,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:netdev@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-doc@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	DMARC_NA(0.00)[resnulli.us];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[resnulli.us:server fail,FV6GYCPJ69:server fail,nvidia.com:server fail,sea.lore.kernel.org:server fail,vger.kernel.org:server fail,resnulli-us.20251104.gappssmtp.com:server fail];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jiri@resnulli.us,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[resnulli-us.20251104.gappssmtp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4CAE754CF7

Tue, Jul 14, 2026 at 08:17:29AM +0200, mbloch@nvidia.com wrote:
>Add devlink_eswitch_mode= kernel command line parsing for a default
>eswitch mode.
>
>The supported syntax selects either all devlink handles or one explicit
>comma-separated handle list:
>
>  devlink_eswitch_mode=*=<mode>
>
>  devlink_eswitch_mode=<handle>[,<handle>...]=<mode>
>
>where <mode> is one of legacy, switchdev or switchdev_inactive. All
>selected handles receive the same mode. Assigning different modes to
>different handle lists in the same parameter value is not supported.
>
>Store the parsed selector and mode in devlink core so the default can be
>applied by a downstream patch.
>
>Document the devlink_eswitch_mode= syntax and duplicate handle handling.
>
>Signed-off-by: Mark Bloch <mbloch@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

