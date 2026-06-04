Return-Path: <linux-doc+bounces-90988-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dp8wHou0IWqPLwEAu9opvQ
	(envelope-from <linux-doc+bounces-90988-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 19:23:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4064249C
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 19:23:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Y8ROKyzz;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90988-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90988-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3125306592E
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 17:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4194A2E1B;
	Thu,  4 Jun 2026 17:14:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE5494A0F;
	Thu,  4 Jun 2026 17:14:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593266; cv=none; b=Q+/i0sxmM9Jl5ZA7+q4XMgL7pfTmIbKFCsFDPL9UFbBW61pkFWykeJ7ucFPFrITB4w7jGXdgzHSx0e3ofVtLlP9Hwx44aLbJNLk4SQ0RWOTxG8OETcMQm195UWSr/YD40o9sJljZ4yFtJqg6i7UWTFdBoh9YgdDaDAPnX9AP9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593266; c=relaxed/simple;
	bh=Is4h+tK1rCLbuW3KFCxbMSU9HjKfJ8hOG/p6BWn6+ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtYDywPK4/isEC3qCeVpaee1WOcKRDbSxinXifNrSLhM+bg2Tg/W5YIKPT6RKAjpOS+aa5QZ2faJ+24eikkjcfprG0L/9uON8D1dqYAo89Ylrd9GRhjzrc/2oacIoPrcoviKmpLG+1MP2xWMcbLRZYNKeXpRd9Z2LsCXmJS0SHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8ROKyzz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A30E1F00899;
	Thu,  4 Jun 2026 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780593265;
	bh=HwwGrQ3Fzu3hXrG2JwBFm+L7WF6JTxE+O6g6sL/Nxfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y8ROKyzzmMromHaFbIkRFfBke10aTOZoG4AbTGZHngzFOP3nCVHXP0uDg3EC8S6LA
	 S2YZc2jrSLuq7kJduF3ffmdCQK9LPARjNnF2W2l4zu+NwUBhQ8SP2WgKxuZRv5mvwb
	 r0o83jiRkFVZeqCtkFxgmAYKjUO5n08vqmTYHgKLbWYfiRd0Lh5NJlR+lUE0paIYnp
	 lQagTph/OOZKwY42UuWGUplEGg7mJgXFRuquBgjkg2myuy4zf/3B5LjlJWt7LTaZcn
	 /1fLWwaYGfTowzDtRMmU8wZQf3kXJzGg60mRWOyFZ/WDAF2DfbeEwTyLysFOPNM0u1
	 E9nH7RwF+Yrww==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 793C7F40071;
	Thu,  4 Jun 2026 13:14:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 04 Jun 2026 13:14:23 -0400
X-ME-Sender: <xms:b7Ihar84HVyRRc3xs0md5kYBIuPakM60cg1pIaacmcUsyAA8lU9_Rg>
    <xme:b7IhapwGVbs-oDM1dMAo9hxv7BMDMYs21bKUckxZxRxpx3RN2wyvRDl9oVH0kY7Kv
    DnIcFyFrEatM_GoqfWJXJwpkoOPlMBZj4wg7HNlukPtsJx6GuPGdb8>
X-ME-Received: <xmr:b7IhanL-yP8X9bPdCoF9cMo9Jd5yCvAXs6FVo_JzR0VvQL5OpVQwBgJAf7nnXw>
X-ME-Proxy-Cause: dmFkZTEiECQ4MHRqDgrsgwv55MOnKX4gVy+9YgKFybarHA/KVwIk21BBtsmLPhAOt5Ys4j
    IaL7A+BJTmqIHdPS0Gvg8ZBt7OiMHMFEZdGw8A4LagcjRH7ZVKriGiTNNW4qTQm3txX05k
    RPE5LiJ0U5EsCtu/9co/h8mxTVBRgP/QDT5W3dveBZ4dLamlAyygHaWOcepNZ9QlKSp3BY
    0dpoOKWnvGaHHDVg8avIis9ZzFiQGZbEIikyBkMNQ3rmsomhY30lUbAb7sK9ShJKUvaPW5
    p9gQZmMY7hKCAX9AdQH7Ipb6yq4u0VCwnw6k3UE97nTvU/BcU1+bJMBKgSvFNwx/JKdiTR
    PjpGHUMptXKWaLxSmlxUBZAkhjfujclBKJaT09eQjieq75wrMj+gwPHPqkHeddogTq6Kze
    CqaOX9kNMyqAlN+KzPeuLr04O7DfblM69NP7cRbR5ZflZVkLDxsjnsWLocnGiXYvXuFh7K
    IwwHA1V/GyEcVKcCBK4abCgsspSPYeg70EUYajgfigeLnJlLxWOEoSI9N8mjPRojCfTaRz
    cHiYhM+P77o8Eir2+f/D5f7oz+p/N7LpQxToS8cV//1iT3VVqh1iGqbj7HuSwoLi+nBSx5
    Afj5z9Di+J3CGkto4LEYZRqkLIqV3311GqeK2g9cQvzN5RnLNfvhWHf6/iFw
X-ME-Proxy: <xmx:b7IhasY2HJbSUb85ah9oz-frV6gAeLKGrt9-b5r2V3aDI1jFiMzX-A>
    <xmx:b7IhasyT0xC-pYQBXcj4JWHyuMg5rgyf0XgpsLeXWM-VaagXgdscdQ>
    <xmx:b7IhajY4EzxvliA4n3IPmUU6HVnZb3ulwe1sAx3zo_6XnfDeCx6pDA>
    <xmx:b7IharwEuKJ_2vcGoV9XRJFNLyrPXi9Rcpp1T4NEmD9FC6DtQx8ELg>
    <xmx:b7IhavFqDRGo1jLz3v00BwICdE_AVF6OcG7eTxNgkn2BMN_EpZmcPhYl>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jun 2026 13:14:22 -0400 (EDT)
Date: Thu, 4 Jun 2026 18:14:17 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, pbonzini@redhat.com, 
	seanjc@google.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v6 10/11] x86/virt/tdx: Enable Dynamic PAMT
Message-ID: <aiGyIQvudD5ZF3lf@thinkstation>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-11-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526023515.288829-11-rick.p.edgecombe@intel.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90988-lists,linux-doc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,thinkstation:mid];
	FORGED_SENDER(0.00)[kas@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:rick.p.edgecombe@intel.com,m:bp@alien8.de,m:dave.hansen@intel.com,m:hpa@zytor.com,m:kvm@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mingo@redhat.com,m:nik.borisov@suse.com,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:vannapurve@google.com,m:x86@kernel.org,m:chao.gao@intel.com,m:yan.y.zhao@intel.com,m:kai.huang@intel.com,m:kirill.shutemov@linux.intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kas@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDF4064249C

On Mon, May 25, 2026 at 07:35:14PM -0700, Rick Edgecombe wrote:
> @@ -152,7 +156,12 @@ const struct tdx_sys_info *tdx_get_sysinfo(void);
>  
>  static inline bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
>  {
> -	return false; /* To be enabled when kernel is ready */
> +	/*
> +	 * The TDX Module's internal Dynamic PAMT tree structure can't
> +	 * handle physical addresses with more than 48 bits.
> +	 */
> +	return sysinfo->features.tdx_features0 & TDX_FEATURES0_DYNAMIC_PAMT &&
> +	       boot_cpu_data.x86_phys_bits <= 48;

Should we warn for >48?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

