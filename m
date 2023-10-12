Return-Path: <linux-doc+bounces-118-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ABE7C69EF
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 11:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 799F61C20EC9
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D1921353;
	Thu, 12 Oct 2023 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951D72134B;
	Thu, 12 Oct 2023 09:46:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id A1368A9;
	Thu, 12 Oct 2023 02:46:01 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23A8813D5;
	Thu, 12 Oct 2023 02:46:42 -0700 (PDT)
Received: from [10.57.69.218] (unknown [10.57.69.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1551B3F762;
	Thu, 12 Oct 2023 02:45:58 -0700 (PDT)
Message-ID: <998b90f4-1b04-72b0-7524-afe997db1b33@arm.com>
Date: Thu, 12 Oct 2023 10:45:57 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/3] arm: perf: Include threshold control fields valid
 in PMEVTYPER mask
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 suzuki.poulose@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Mark Rutland <mark.rutland@arm.com>, Zaid Al-Bassam <zalbassam@google.com>,
 Reiji Watanabe <reijiw@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
References: <20231010141551.2262059-1-james.clark@arm.com>
 <20231010141551.2262059-2-james.clark@arm.com> <ZSZb2H8O5fuU3UrA@linux.dev>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <ZSZb2H8O5fuU3UrA@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 11/10/2023 09:24, Oliver Upton wrote:
> Hi James,
> 
> On Tue, Oct 10, 2023 at 03:15:41PM +0100, James Clark wrote:
>> FEAT_PMUv3_TH (Armv8.8) adds two new fields to PMEVTYPER, so include
>> them in the mask. These aren't writable on 32 bit kernels as they are in
>> the high part of the register, so split the mask definition to the asm
>> files for each platform.
>>
>> Now where the value is used in some parts of KVM, include the asm file.
>> There is no impact on guest PMUs emulated with KVM because the new
>> fields are ignored when constructing the attributes for opening the
>> event. But if threshold support is added to KVM at a later time no
>> change to the mask will be needed.
> 
> KVM should treat TH and TC as RES0 if the feature isn't virtualized. I'd

Ok will keep that in mind for if we virtualize it in the future. It
looks like it will have to happen conditionally depending on the
presence of the feature. But it looks like your current patch has the
res0 fix for now.

> rather move KVM away from using ARMV8_PMU_EVTYPE_MASK in the first
> place. Looks like we already have an issue with the NSH bit, so I've
> sent the below patch to fix it.
> 
> https://lore.kernel.org/kvmarm/20231011081649.3226792-3-oliver.upton@linux.dev/
> 



