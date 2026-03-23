Return-Path: <linux-doc+bounces-80604-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA5wFNjfwGn6NQQAu9opvQ
	(envelope-from <linux-doc+bounces-80604-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 07:38:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E0D2ED215
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 07:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C10C3008CBB
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 06:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931C9340293;
	Mon, 23 Mar 2026 06:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UB2IdYLc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MK+cf+cH"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFB33F394
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 06:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774247877; cv=none; b=eJppGA0/gXy4jebGPxAuYV80P0HvLG/U9fb9zZLoPYuF9JoTNSz0UbJS/ZfTAjRrjHEgfoMRIBghg6mcAjlB+ABL1nN9QYLpvy5OQSaZBMDtw7lc28F3grM3/ORsfOAFIhBqWWyFnhHAYw/C/SMFkHOV89wyP50vt5ZO7sxSxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774247877; c=relaxed/simple;
	bh=qOagRt1/NRe7HbDeaKAzQ9u/KhNjsAjWbYHZvrS0+AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzBKJILl2KzwQxc9rwcRfXVy38pZN+C76Szh7LXy53RS3wImEo3sBP34P/Y8U10NcK9mPigZLu3u65SYgENYmUe3cx6lMYwI29gDfeeIFFoypNfRluigdD7svWzGhotLr30vjT8hp5fLDb4PbU6TflYiPPGfTW4Re3DGaI+gZrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UB2IdYLc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MK+cf+cH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774247872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ISK/exyUdJ23yO78+Gn42xzI5rMH8hkY//83Yc4RV2Q=;
	b=UB2IdYLcd4yOyAhX4gKG3HLhsMAaNZWK/ctv05+d94vqUEX7boBoxi5NSG+u8eEWOD4jTO
	f43H6Z7zY5di8iifGNn0xCTmlcKknlAiYGlAjCJ2W6cR6JvyfF4UcnsLLFu8QbVDLc3qyx
	F+ybfIxCXY9G02jGiyF3rqtWoly7CpM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-_WTmhjy0OyycnUske36vSQ-1; Mon, 23 Mar 2026 02:37:50 -0400
X-MC-Unique: _WTmhjy0OyycnUske36vSQ-1
X-Mimecast-MFC-AGG-ID: _WTmhjy0OyycnUske36vSQ_1774247869
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0998a441so25397614a91.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 23:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774247869; x=1774852669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISK/exyUdJ23yO78+Gn42xzI5rMH8hkY//83Yc4RV2Q=;
        b=MK+cf+cHG1bZxK/7NTyRpS3bcVWUdgufKUxH8K0SXE2ZqoxVo5Jkt5v7fVYTzN0h6E
         vnfeGZd4zzm6gwvmacVncKSplVDpZ25ls8UEOHfZ4KL2AoKUxiOL8usGug5lKepBNCik
         s3FRfu9p8oQiSsMiHHjj2stt1OLD/HTGbiGs8r+fqag68dG5QrVvw46Mct2sSOGd4YlH
         /iKK1rVlJUvJ+3QokdmBY0vf8yW3Z9ZY0icNtVyDAa3rOh+L7o5SDov3cBn62SvliLXs
         BRDH81jOAt+NCO+xJmKrnhGR8/+v3jPMrbDX7BCGFj7SBrtHT6/x/8kDue+okhT/09B0
         o2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774247869; x=1774852669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISK/exyUdJ23yO78+Gn42xzI5rMH8hkY//83Yc4RV2Q=;
        b=fuMR1USVIU03J8AIaEo5oDK9d1HilwihKDL9sWagZMM7azQ0wkSR63VM/v//mivziv
         MBt7rszcOJHmIurszApcJrDtoFrcebbqhabeORl3G7pi/XA/sw9LpFF0syI3XqNW95kn
         ERHQl5u56wwjXaxQbGhejlHRm2BwQT61Vl0ONn0w2JLX+/t1ThS1dHYJ80KzyfF2IKPU
         vasfpH5kLzo7+mC0aF4dKQl+cptgDU1D6Xs5KeuJpX7IQCfga8vmImDH98gS7b7p8lNq
         PI+Kj+ZmGB5KBE8SpG5Z/SEwXqRTpl3EDh03p1S5XQJNvPy6xB9AwSgRf8KiaU46CwXS
         g0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsWkBhX6aJ5wX+Kqfln/9vO71ywAsVTiL7OkS7alzrBDXTfczZ0K/CJc9WukvJy2KZ7AkResxTmMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeThFmVPrW7h9DvlRAtgrylY6JEB7dqP+zptkCw/etA2oLUb+Z
	oFnQqg1r8PXl3TkzPX1XIKJ9uGb3OmSVlTemYf1uHYK8OTqGY+SWfzeR+1rOTtoksPt372i4ARa
	Df/iEycqHAAsuF5/qVZqNoRSsabt0Y0gWMwo1jX4Ru4SlYFQGvzV5u/s1+kXCtQ==
X-Gm-Gg: ATEYQzwNYj+FXgOlQe0AuOOL7Hw0htfsleb0bQxxBTW40uaqKZ2IWKK84BrVvBH/V7Y
	etDF5R588wbdWrIlBTtzClZwyMqRPsaHrsMhuTOc9V3fnbh37eFkkjLORIeDkVCZYlYHlTu8fOK
	0AR/ZjPLIo+hAClxvBtGrD8H8AruGiCEmwXhTs4W8937XbGjvawq/wHzQJTrz/LzbKdmP1y2308
	DMTq3pVVIka/fZaD7P9x1bTFe1xockhSqxtDe9ZFN4XMe9yKQ0LJucf3YWyxELeGtyl2m4ngSuH
	vBBD0D18tGRGSORXu/L+tJ0TyOfkAnSdrBYenKVtqUbVG/bQJo/dxpo5+iEm6GEj9LF0OoQf5uZ
	MQ/2MjyHTVLnY1tjaOmEa6vaRj7JyfWobVxHXit1cVZun6jql0qciy4xf+uWMyYAS
X-Received: by 2002:a17:90a:d406:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35bd2d1f007mr9090108a91.23.1774247869492;
        Sun, 22 Mar 2026 23:37:49 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35bd2d1f007mr9090083a91.23.1774247868996;
        Sun, 22 Mar 2026 23:37:48 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ec3aasm10906457a91.10.2026.03.22.23.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:37:48 -0700 (PDT)
Message-ID: <9f5fa983-155e-411a-b543-e7626d6f04b1@redhat.com>
Date: Mon, 23 Mar 2026 16:37:34 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/40] arm_mpam: resctrl: Pick the caches we will use
 as resctrl resources
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-16-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-16-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-80604-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gshan@redhat.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,fujitsu.com:email]
X-Rspamd-Queue-Id: 46E0D2ED215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Systems with MPAM support may have a variety of control types at any point
> of their system layout. We can only expose certain types of control, and
> only if they exist at particular locations.
> 
> Start with the well-known caches. These have to be depth 2 or 3 and support
> MPAM's cache portion bitmap controls, with a number of portions fewer than
> resctrl's limit.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Jonathan:
> Remove brackets
> Compress debug message
> Use temp var, r
> 
> Changes since v2:
> Return -EINVAL in mpam_resctrl_control_init() for unknown rid
> 
> Changes since v4:
> Set alloc_capable after other settings (Reinette)
> 
> Changes since v5:
> Missing 'have' in comment
> Set cdp_capable to true for L2 and L3
> ---
>   drivers/resctrl/mpam_resctrl.c | 91 +++++++++++++++++++++++++++++++++-
>   1 file changed, 89 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



