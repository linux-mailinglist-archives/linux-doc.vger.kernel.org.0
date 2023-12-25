Return-Path: <linux-doc+bounces-5904-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8881E1AC
	for <lists+linux-doc@lfdr.de>; Mon, 25 Dec 2023 18:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42EE51C20F65
	for <lists+linux-doc@lfdr.de>; Mon, 25 Dec 2023 17:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7134B38DD8;
	Mon, 25 Dec 2023 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iAp5UAUk"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0294231A66
	for <linux-doc@vger.kernel.org>; Mon, 25 Dec 2023 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xFIKp49g9qtmgLHHMQDPljPyQKT4HBMsbNmu6sA9PR8=; b=iAp5UAUk7p6ad0qrzYfv6hy2pn
	rCpp3wPlDwi5qInqm+10NcE4U/ulDeWFRXxXAWQuVjHu7Gw5S5oIP9XkhBiJ04HI9QqIZ03JRvJWJ
	4laG5NxSMycfFfTqmiNb+WPgH1n5tF6+5VbTDHqilM1UP96amyC2NiUZpMDjEoq+ZCbesfnfDaccZ
	DZzq8r2Kv0vzzvmZox2EjgjdedE+NY4KQXl7qfsVSQnAiWihVlhUFW11cLKj2wlSyntnguO8CMOXt
	KNc5xmUsrRVs9m5IWIfNKkY+IvxIWCzCErqpmlklm0TqToNrfE6uSrmgnK3F7CibH14tZuqnKucWw
	ZIN1pn4Q==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rHoRC-00B6zo-35;
	Mon, 25 Dec 2023 17:08:23 +0000
Message-ID: <df7d110b-a50c-4293-b5d4-45913fa6909e@infradead.org>
Date: Mon, 25 Dec 2023 09:08:22 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/nouveau: uapi: fix kerneldoc warnings
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20231225065145.3060754-1-vegard.nossum@oracle.com>
 <009fcdc4-b10a-4ab9-b368-7cea75bb74e2@infradead.org>
 <0f04dd81-1b0f-4408-b4de-63a01895b0a5@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <0f04dd81-1b0f-4408-b4de-63a01895b0a5@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/25/23 00:30, Vegard Nossum wrote:
> 
> On 25/12/2023 08:40, Randy Dunlap wrote:
>> I do see one thing that I don't like in the generated html output.
>> It's not a problem with this patch.
>> The #defines for DRM_NOUVEAU_VM_BIND_OP_MAP etc. have a ';' at the
>> end of each line:
>>
>> struct drm_nouveau_vm_bind_op {
>>      __u32 op;
>> #define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0;
>> #define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1;
>>      __u32 flags;
>> #define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8);
>>      __u32 handle;
>>      __u32 pad;
>>      __u64 addr;
>>      __u64 bo_offset;
>>      __u64 range;
>> };
> 
> Do we actually ever want preprocessor directives to appear inside
> definitions in the output? If not, I think this should work:

Not necessarily.

> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 3cdc7dba37e3..61425fc9645e 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1259,6 +1259,8 @@ sub dump_struct($$) {
>                 $clause =~ s/\s+$//;
>                 $clause =~ s/\s+/ /;
>                 next if (!$clause);
> +               # skip preprocessor directives
> +               next if $clause =~ m/^#/;
>                 $level-- if ($clause =~ m/(\})/ && $level > 1);
>                 if (!($clause =~ m/^\s*#/)) {
>                         $declaration .= "\t" x $level;
> 
> 

but that didn't work for me.
I don't have time to look into it any more today.  :)

Thanks.

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

