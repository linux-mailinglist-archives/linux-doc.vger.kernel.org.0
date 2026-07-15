Return-Path: <linux-doc+bounces-96852-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G8cjA7nQVmoMBgEAu9opvQ
	(envelope-from <linux-doc+bounces-96852-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 02:13:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB37599E1
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 02:13:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=hjeO4YTG;
	dkim=pass header.d=redhat.com header.s=google header.b=FAvB13di;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96852-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96852-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D93A302798B
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 00:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70B815A864;
	Wed, 15 Jul 2026 00:13:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851827082D
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 00:13:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784074423; cv=none; b=dcVzODGckqO5E0DqOmtORANpLVgmPbAKILJYEIaKXyjLQte2vKTr8WDdmGr0+WstI4uuOABjNi4VrJ8mB36lK+03FM5iZl9+NKJxX9DJo5Yh4K2vXoKwqsU+i5RanSkc4XD2iSEKsuL0II4xMa87VhuhCaFtezUUU7eMCP24ULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784074423; c=relaxed/simple;
	bh=8AXyAqhasfY7wRdYuXm0Py4OabfXua0ulV/T1L8jNEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEf/vPnohPfSbc185hSDQa5v9DzYhLYDK6/dnUlmmp/yKLJEowZkjXqFbheuJrZ0PEJ6ITQESDD2+xqWld5aV7LiJdQ0n+e9ccmfKWSRu9XbtZ7+JeJyOHtHK4OTQeZa9/rBQEcwOxC5nffhmV0eBzhxULKT35izo1QuvrTpQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hjeO4YTG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FAvB13di; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784074419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aADQWG87fq6XITbxBIYillliqdnDSadEcTkAR2o/L7Q=;
	b=hjeO4YTGKTf5UnBFkbukJSlnns4YB9f5iJS1J/FDP3h1XXtd1NhLUFw8bId63z8hfw38wX
	AO+0AZYGqYl/RPcXjkLO1GqHZDXL0u2x0M2jv28S0rS3yB/AlWEZ5dnUmjAqRwVuix/TnK
	xgYvX21dei4S/ngHccRtCr7uLYhYvHY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-hLUj3KFENju1BhzzP3eH6Q-1; Tue, 14 Jul 2026 20:13:38 -0400
X-MC-Unique: hLUj3KFENju1BhzzP3eH6Q-1
X-Mimecast-MFC-AGG-ID: hLUj3KFENju1BhzzP3eH6Q_1784074417
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c890bac374eso12391387a12.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 17:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784074417; x=1784679217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aADQWG87fq6XITbxBIYillliqdnDSadEcTkAR2o/L7Q=;
        b=FAvB13diBei5DZx9oiTJvqRndOcuCYRVl9LegMwatpQObpnb7CxL2xGHajneNbCApc
         FIe8Dk9GubqWdTlJJ8HMadmi51w9jcQqewmW7sur01/E+aA3+UpOzcCIDVEUGYz+gY4A
         sIvyVRmATMk8FCJS9ert+NMc6tKgr1iXOCtNpXsQwOEd1PdjQAN6IF9UJ8/lIkSg6IWT
         DB8ir5dWFObT1eo/540S6xhcsM0mM2CPi7rMjAXx92MMM/H38dNbTM8Qg+UOCkuKpt9l
         xNbDNapB8c4KICwn2NBbbeq83Na6lPVlQKKHOT4wjvVccmqDwX48uE2YsgP7EoSHUpTm
         7fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784074417; x=1784679217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aADQWG87fq6XITbxBIYillliqdnDSadEcTkAR2o/L7Q=;
        b=GJwzFNXyi1qzlLlGSCL7OdPJuko9E+Ig+mTI2wdSxktLFxPmxCaNNJ8wPwpbbqhtei
         btPgOMF0sCV2V/qUeJMATOFTDw0rhky80hdiDWhR68GCzHDLnZhP05tBlW/2rxQdabRr
         2GJIO5k7+Y+UjlbTD35orn6TGGnUmv4oEPmbSgKLo/1jXPAS9KUXFbmbI9NX6W0zAyL4
         lo3YiAS0dbYqZ/AMJK3cpOU3WrsvarV50k3uAn97V3ceKAUSQu7h+VQMLOi0lClRQKOL
         pKr8IDkX1FcFwbOmgF082O3yFSn/WVi/oTxgDnsTqSwhKYJz97jnDnnGk8+Jm6jU4Q9+
         msoA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0a0RAlbzrkX3d39EL8/wuxG55CC1cTcoj0EE3jLXWoMtbYFck+j/s34LtbV3ElNk36LeGrntvx8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iUfRi06cPN5KY6GNQjAhr+bfiLXk1N+W7bn0qwxywf3nY6Tl
	rmjopjgSgyEp6YYRUs2TqNPkMC9MtL443WIb1C89dor0YuMVBqWIzpCjuAxUwIwGqcJYT3I0D1g
	9jv+h8Ta0gv8xzbr1E03oFbV6qY9+vDYqDdhrSWbXgTx9UJ3AUnVs96VY5EycTA==
X-Gm-Gg: AfdE7ckFccu02H0PdhV1G77ykcik/dT6DZe4oc3oGx8CFQPnnV02GGM+fMyB/R3hYwF
	sfhvmSGWaff3su5jJF5mIakrtBitS9AIO/6LUnHMUyUhQjmU/s3u5UoU3rk8Jb171WGn6k36WQN
	jXIOGHkvvlqOmgGWPlvekqNZchW7FY93XJFE20DJcC78EnRk17p4DIkNO/tKQc0dCNX6sRPkuvN
	8t/ykJfQH1aaWWBzGDvfh3VdWtbvo6BD23n5IH1kRkdK2J/VeW8rNsKTkf7GwcwLL/cKBo+otAG
	zBK/jsGdD+U7NIY8R4CRFCKbj3I+OWeDSEx77DFVw1MT2kQUgydmAj1rh28oLHdtedV+n/ZD9pJ
	RNmhegJwSLqVQAPmM9bsqCYHd65ffp5QGK1Ozjh0geoayxxZpqqGrOA==
X-Received: by 2002:a05:6a21:3998:b0:3bf:6c08:fb98 with SMTP id adf61e73a8af0-3c36c4099b7mr705230637.58.1784074416929;
        Tue, 14 Jul 2026 17:13:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3998:b0:3bf:6c08:fb98 with SMTP id adf61e73a8af0-3c36c4099b7mr705190637.58.1784074416440;
        Tue, 14 Jul 2026 17:13:36 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm92038212c88.11.2026.07.14.17.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 17:13:35 -0700 (PDT)
Message-ID: <9892de2f-9e29-41ff-997b-a6a2e7c98585@redhat.com>
Date: Wed, 15 Jul 2026 10:13:28 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260709093111.367851-1-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260709093111.367851-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96852-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ben.horgan@arm.com,m:james.morse@arm.com,m:reinette.chatre@intel.com,m:fenghuay@nvidia.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:corbet@lwn.net,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:dave.martin@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gshan@redhat.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gshan@redhat.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90FB37599E1

On 7/9/26 7:31 PM, Ben Horgan wrote:
> This version fixes a couple of non-functional mistakes in v4 pointed out by Reinette.
> 
> The patches should stay together so please could this all go via tip.
> 
> Changelogs in patches.
> 
>  From cover letter of v3:
> 
> This is a new version of Dave Martin's patch [1] to delegate rounding of
> bandwidth control user values to the arch code. As there is now more than one
> architecture using resctrl, I split the original patch into two, a core resctrl
> patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
> break down and ordering is sensible and whether the pattern should be followed
> for any future similar changes.
> 
> This does have a user visible effect on MB schema when using MPAM hardware
> with 'bandwidth_gran' greater than 1. I'm not sure if MPAM hardware with such
> coarse controls exists in the wild but it is spec compliant and I've tested it
> on a model.
> 
> [1] https://lore.kernel.org/lkml/20251031154225.14799-1-Dave.Martin@arm.com/
> 
> v3: https://lore.kernel.org/lkml/20260515140612.1205251-1-ben.horgan@arm.com/
> v4: https://lore.kernel.org/lkml/20260706160639.2136674-1-ben.horgan@arm.com/
> 
> Based on v7.2-rc2
> 
> Ben Horgan (1):
>    arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
> 
> Dave Martin (2):
>    x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
>    fs/resctrl: Factor MBA parse-time conversion to be per-arch
> 
>   Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
>   drivers/resctrl/mpam_resctrl.c            |  5 +++++
>   fs/resctrl/ctrlmondata.c                  |  6 +++---
>   include/linux/resctrl.h                   | 19 +++++++++++++++++++
>   5 files changed, 42 insertions(+), 11 deletions(-)
> 

Looks good in my tests on NVidia's grace-hopper machine. No errors found
from the kunit-tests and the MBW limiting works with more precise granularity.
The code changes look good to me either.

Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


