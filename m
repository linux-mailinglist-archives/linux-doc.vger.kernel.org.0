Return-Path: <linux-doc+bounces-75100-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPdbKXI6gmmVQgMAu9opvQ
	(envelope-from <linux-doc+bounces-75100-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 19:12:02 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E970FDD5E7
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 19:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F66B30086C0
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 18:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A72C36214A;
	Tue,  3 Feb 2026 18:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PV2iG6X8"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5243644CF
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 18:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142295; cv=none; b=nGMM17AdV8XsGAgEa8Is71eDzF9OIyFwYmyNucsz0VKDyfju7bSOPD7aCQqpe1BqjTLRyPYGbCxMB+GVcPHE/3IZan4Ec+I+SG1GFSij1vhI5TG3LiEWcdPwCmhB09NDqC+agfo36lm3dmJZ/8B23oS24jTInzzaHVkEm63add0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142295; c=relaxed/simple;
	bh=kva6Ya/khe7RZMC7BOPogiya370EzKQJtsEC+qmuRMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eycVrnukLP0onyQGRmrf/dl7FJfBwGZ4EmJ5zjhIrpQ/8VhibuyuFvrM3DOzG7uB6/EOJzUf4E+a2z+MRZm77cJ4FWCkcAFdyPjtlZQj9mDoqjpaHxIzz9ppJF+Khg/SmqnNpktyCXuO/jZlU+XuiftVlQ/4q1loWBjcAJG2XQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PV2iG6X8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3PygZPHeuSKxKR7m820utBvqDRj6OyMctKsNBESyxzE=; b=PV2iG6X8UeeVJqQDZbFkQoZ+ZX
	uU5Joj1oZpjjgrOVhdanwolscSdSUSSykkXwxUsLZvqnDf2fG+Yc2Gh1FbVnZ/F/zR5HPD71Wd+3t
	oyx5CTZJ5LgUH4hA4CLal7bDdP7ysXUU9UlLQ0ysHtnLK7hMxmZDb7Jofxp0ClbtAmzwGAtU24lGG
	79TIz6Xy+hvSNYayVuDLVBQdM/1kSFIaSeYcaOK2lOWlb/Zlc8h5Bnax5zsgMPBn8UPUhtV9g1RuY
	/Gx2aLAxwQjci1huwUr6G0CSYRqhxUkMlnxt4Wtfsh1QYx3tyRpyStVvPZKsnOuEN4SpQeowIPUKn
	RAGdYzsQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKs7-000000076ou-1Mbj;
	Tue, 03 Feb 2026 18:11:31 +0000
Message-ID: <087b5848-8f51-408c-bd5a-d51fea2731cd@infradead.org>
Date: Tue, 3 Feb 2026 10:11:28 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: pt_BR: add initial Portuguese translation
To: Daniel Pereira <danielmaraboo@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20260203120859.65735-1-danielmaraboo@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260203120859.65735-1-danielmaraboo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75100-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lwn.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: E970FDD5E7
X-Rspamd-Action: no action

Hi,

On 2/3/26 4:08 AM, Daniel Pereira wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0efa8cc67..c5e0e1f2b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21141,6 +21141,12 @@ F:	include/sound/pxa2xx-lib.h
>  F:	sound/arm/pxa*
>  F:	sound/soc/pxa/
>  
> +PORTUGUESE (BRAZILIAN) TRANSLATION
> +M:	Daniel Pereira <danielmaraboo@gmail.com>
> +L:	linux-doc@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/translations/pt_BR/
> +
>  QAT DRIVER
>  M:	Giovanni Cabiddu <giovanni.cabiddu@intel.com>
>  L:	qat-linux@intel.com
> @@ -28876,3 +28882,5 @@ S:	Buried alive in reporters
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>  F:	*
>  F:	*/
> +
> +

Don't add extra blank lines at the end of this file.
I.e., that entire last diff block shouldn't be here.

-- 
~Randy


