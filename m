Return-Path: <linux-doc+bounces-84313-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOoWGOQo6mnkvQIAu9opvQ
	(envelope-from <linux-doc+bounces-84313-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 16:12:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01923453823
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 16:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7886F300AD90
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 14:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487793148CF;
	Thu, 23 Apr 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jxf6beRu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Up/C/jwc"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94650310784
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953548; cv=none; b=YyXrvpPAcUcamaw2a7m1QWFbdKIWLHTNTrelnqnsXQAL3zae6KX1wxYQWF21a+rWtsWZQHbcE0rXzd1IEdhPJFIWxpeKzBH8ACMOPq5q+tuaBXUDGqKKIYEn+YZsNAg9Erqnzgims6xMi1ZggpbEU4lHWFvIg87nv/1RkIbTjC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953548; c=relaxed/simple;
	bh=DN+ouaVoyOfzP1qbJqimNJE+Or/ATyJ/QGg+moKK+G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SN2m9RHss2TukWtEEMBSLjfhelnDzxvec8VUvILu9Qosmq+EheopdwB3VOyLPnACN+1vInsZm0811swMsnEH2wq8+zG1vZU1aG38YQAWm9tycJAMLdrRNQexc1R67UjK8e1ypcgkQnMeD0UNZY3P5sxgEnU9zRAkwT32pA6Q1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jxf6beRu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Up/C/jwc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776953545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30/URGWxQ2aDJOTEEoof2WFLjwrIki9pEdY8zPtEL0g=;
	b=Jxf6beRuhXAEU92gmk+EXbjPKGJXMZzAHjZEvsiVD0jnq/h19ZmsdOrHKvFUl2rxd4qrZX
	vHlA/gVu73BRqYuX8KfQijEfOHdq649EwhjV7FMpwDrwUh/jtsRHEIsEhm5prNcxIL6KCU
	sZ6ZfawoeJbeFpWxMHjndW/dtdtTQM0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-qc6hvRYiPxW38R-5q9BjLQ-1; Thu, 23 Apr 2026 10:12:22 -0400
X-MC-Unique: qc6hvRYiPxW38R-5q9BjLQ-1
X-Mimecast-MFC-AGG-ID: qc6hvRYiPxW38R-5q9BjLQ_1776953541
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so7874830b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776953541; x=1777558341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30/URGWxQ2aDJOTEEoof2WFLjwrIki9pEdY8zPtEL0g=;
        b=Up/C/jwcYZggi4jwtp4B930CRb/qhg5b65CsJvskQt2JmkXPinbukomp7Z8RAcv5Bc
         1svpZroNAtYeo5L5NdV5OFikSDLcol4YWL0jY/KW48mF37PNOYlsCJDAloDCuavFqz7P
         9YGAz916HzrZNEMCMN8wBGHINboBtwlrmu3aA3lJC0DvBW84HjwOtA4X77jszr+V6yAq
         qtt3FZRTeK/lH8iqfojJkJOVwm0A/YLfa7skTqMw7LF/Tqq+OHiS+zqOY3vtkbQNfLgR
         +JFd9L0zQzoLVFQpBdPqLnvX8v+0/uzu9ycWDYsRfha8jgiZlL6DWAfowxA7rE86lV/5
         4xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953541; x=1777558341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30/URGWxQ2aDJOTEEoof2WFLjwrIki9pEdY8zPtEL0g=;
        b=dAA150v31ZDqTFY2jQgCXi9xRSzzT0+BTO96t9rGmLBB3skvLQolQDIntlNYl2H40U
         6E7KS9A2ZpmutmLJ+n6yQut4jfdzJxK5xJqK+BSUNOhl1DiAQO6xW1J4VPTJtkzBdbAe
         IxZ1rwGnGBifKHmrDkrUfMf1kGUjUZAPSiOmoZn7YIeiDV9DGb55Tv0WOG5HuIXVbyjy
         ArkKgIVBywOhi7q+SJmskfnlZMqKq6Kn6mByij4cWSrdgiLI/7XPEd42cZIokWrRFTzc
         mU+LIEh/IdI/2K8aonCopfWmybMTK6z9Q7Ar38iwo1bNCo/BSkG8gw1qlmeanasxNydK
         oOOw==
X-Forwarded-Encrypted: i=1; AFNElJ/1OWUp+gsKE+k7CseyB2LzV7BasdlaiVEdOkg6SFPOZcYK5rUfthzGYhwec0+UIyY2YKDVH67lXGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/EuI7PQKLXi9J1DfO0zFhc1HibsE13tQSV0YJIitcRBUGA7/H
	IuFNxKS+cN6qxivHojzEoGZoXqOcHCXc+hwgPlX+wppxXwGfuxZ6549UxtbnLcalj3PzVXIA6NZ
	78sBJCyWJAcs+y4CXCwrla2xYTo+qulVP74WvCzbm/4Ng2dLdezNr+te1ShVpZg==
X-Gm-Gg: AeBDietCGlCDPSphA3d+8KRTVKU4RV9ENirGnvYLSHVFf4PN1Df8LEwvCIPehd/Z+5u
	dcaDOwwuAa79R4nnPKc7YMvQY/3qdT/QZ92NJEbap2RQRDALa9aHU53rOyWYWlNqHRakfIzWfE2
	ls0EsUc17AVFCQqQoDv6lGOYEElZ5AoFh/QpzUqqd4ka9iflD4KwhzSoCVSUzDX08fY3d9uTGmS
	c1y0qciQZ6boIcZseMOUP1Oe02nE/I64JGzxl+groYwEeHM7O4qTUk7UFWvx+ALYDOMqQVcNxuR
	ohslg5ttmFGr3836/ZjngPI545DDB3vzkZLOkFbTJANqki5A5B+XT1dqkfS+K0H96hwTJiMzpUI
	J+RWz2KLWh02wB+QR5ms4k0za3zuS26iVG12cncpiNTpRECFRU/+CsDhk58o3hyBIDp4=
X-Received: by 2002:a05:6a00:3695:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82f8c3dac2dmr26504364b3a.0.1776953541054;
        Thu, 23 Apr 2026 07:12:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3695:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82f8c3dac2dmr26504302b3a.0.1776953540507;
        Thu, 23 Apr 2026 07:12:20 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe92desm20295399b3a.44.2026.04.23.07.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 07:12:19 -0700 (PDT)
Message-ID: <65cf5447-9876-40f8-a802-ed21b976a91c@redhat.com>
Date: Thu, 23 Apr 2026 16:11:51 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 federico.vaga@vaga.pv.it, carlos.bilbao@kernel.org, avadhut.naik@amd.com,
 alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de, dsahern@kernel.org,
 jani.nikula@intel.com, mchehab+huawei@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, tytso@mit.edu,
 herbert@gondor.apana.org.au, ebiggers@kernel.org, johannes.berg@intel.com,
 geert@linux-m68k.org, pablo@netfilter.org, tglx@kernel.org,
 mashiro.chen@mailbox.org, mingo@kernel.org, dqfext@gmail.com,
 jreuter@yaina.de, sdf@fomichev.me, pkshih@realtek.com,
 enelsonmoore@gmail.com, mkl@pengutronix.de, toke@toke.dk, kees@kernel.org,
 crossd@gmail.com, jlayton@kernel.org, wangliang74@huawei.com,
 aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260421021824.1293976-1-kuba@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[46];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,lunn.ch,kernel.org,lwn.net,linuxfoundation.org,vaga.pv.it,amd.com,linux.dev,hust.edu.cn,link.tyut.edu.cn,alpha.franken.de,intel.com,mit.edu,gondor.apana.org.au,linux-m68k.org,netfilter.org,mailbox.org,gmail.com,yaina.de,fomichev.me,realtek.com,pengutronix.de,toke.dk,huawei.com,amazon.co.jp];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84313-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 01923453823
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 4:18 AM, Jakub Kicinski wrote:
> @@ -2316,9 +2316,6 @@ struct net_device {
>  #if IS_ENABLED(CONFIG_ATALK)
>  	void 			*atalk_ptr;
>  #endif
> -#if IS_ENABLED(CONFIG_AX25)
> -	struct ax25_dev	__rcu	*ax25_ptr;
> -#endif

AI reviews notes that this leaves behind a stray doxygen comment. I
think we are better off with a follow-up that with a v2.

/P


