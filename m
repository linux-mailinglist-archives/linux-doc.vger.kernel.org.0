Return-Path: <linux-doc+bounces-86541-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKdCBEot/mmQngAAu9opvQ
	(envelope-from <linux-doc+bounces-86541-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 20:36:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 681ED4FAA39
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 20:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBAD1302C5EB
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 18:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBB83358AF;
	Fri,  8 May 2026 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2oVuIEaO"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5747CA45
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265414; cv=none; b=RDEM6pJyqDzYKIhXH8kxn+SUr8ez5jLMtkzNxtBm5/60DD7WACpCHn8VmWkPXCENNuC/4C+eVyuwUxinVVLT9hlhSZPpiwBiq14jzQDDq4kjfFzNuPC24xRJHjJtgPM7Z5Z8NEkR7u8xtEQZ57c56xNv2YAzJG1yNsHMzxVcimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265414; c=relaxed/simple;
	bh=h96QI8sAyvSd31nBbtM2Woe9Zc3O3tsUieuOYDcl4WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CZGj2edLdlNIjpPONCMplLURVzHh4pyld6PzG/AU3NXz58G8ST8P84IWrarJtUXWvKhyZlVDbPaoNaKlGR6KGUXIOX1C+W3af/WlpSJGiJUSkLLx/96fqBxImFB5od2W+U6/zf01P5Prh2Vm+hanURWSIRhNqU6lXnFlcHCoZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2oVuIEaO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=6NMoLqHFyd73ffPyW0rx+cIGr/qHa00Gmqg55Y3BWCQ=; b=2oVuIEaOSc1+rFoRk1jvwl7Gd7
	3CYLzxXlAcsxUHbaZKY4hfuPukaEcJ33/3hMtEL4iWWnrC5ik5SfP4n99ZZ5c4P4tV89iiC/nf2KN
	k7E0GKuCJrQd7sKlLfPD0kyM8Pub6Sw0uIzgj8mV2O7Uq4ONsRX0+60Qj4OZRyKR3jrwYLzPvkFeb
	lrxU9HmWJ1q+DiwxjmozWau7EQ0aEmXVzzVA/R3IUZF0Zz9F15I8/LnZhs4Npc1+6pRt4/CcuqgoJ
	IKCmyqPowUXyx6J/dV4Eh4T0gyIEdsKaldRCYCFct94iTseNnpKR5Pj0xcE+iJfkpsQlMPtHLsDJt
	IioR0BcQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ4D-00000007H39-0kCX;
	Fri, 08 May 2026 18:36:53 +0000
Message-ID: <b7b5c3d1-faec-4fc7-b018-8ede57214849@infradead.org>
Date: Fri, 8 May 2026 11:36:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Documentation/gpu/rfc: fix toctree
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <cover.1778238671.git.jani.nikula@intel.com>
 <c9678a78749a71cf86941f37116232dbc7c23b5f.1778238671.git.jani.nikula@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c9678a78749a71cf86941f37116232dbc7c23b5f.1778238671.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 681ED4FAA39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86541-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,infradead.org:mid,infradead.org:dkim,intel.com:email]
X-Rspamd-Action: no action



On 5/8/26 4:12 AM, Jani Nikula wrote:
> Just one toctree is enough. The .rst suffixes are superfluous in the
> toctree. Fix indent. Add missing newline at the end of the file.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/gpu/rfc/index.rst | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index ef19b0ba2a3e..26a7ebe6fb44 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -18,23 +18,9 @@ host such documentation:
>  
>  .. toctree::
>  
> -    gpusvm.rst
> -
> -.. toctree::
> -
> -    i915_gem_lmem.rst
> -
> -.. toctree::
> -
> -    i915_scheduler.rst
> -
> -.. toctree::
> -
> -    i915_small_bar.rst
> -
> -.. toctree::
> -
> -    i915_vm_bind.rst
> -
> -.. toctree::
> -    color_pipeline.rst
> \ No newline at end of file
> +   gpusvm
> +   i915_gem_lmem
> +   i915_scheduler
> +   i915_small_bar
> +   i915_vm_bind
> +   color_pipeline

-- 
~Randy

