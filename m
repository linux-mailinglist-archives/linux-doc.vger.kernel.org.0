Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A12D7082F6
	for <lists+linux-doc@lfdr.de>; Thu, 18 May 2023 15:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjERNk7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 May 2023 09:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjERNk6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 May 2023 09:40:58 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 321A71A2;
        Thu, 18 May 2023 06:40:57 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4CA81FB;
        Thu, 18 May 2023 06:41:41 -0700 (PDT)
Received: from [10.57.82.163] (unknown [10.57.82.163])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F56E3F7BD;
        Thu, 18 May 2023 06:40:54 -0700 (PDT)
Message-ID: <e9918d6e-ca5c-5a3a-6ff4-27acf7f73b30@arm.com>
Date:   Thu, 18 May 2023 14:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] Documentation/arm64: Update ACPI tables from BBR
Content-Language: en-GB
To:     Hanjun Guo <guohanjun@huawei.com>,
        Jose Marinho <jose.marinho@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jeremy Linton <Jeremy.Linton@arm.com>,
        James Morse <James.Morse@arm.com>,
        Rob Herring <Rob.Herring@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>
References: <20230518105202.451739-1-jose.marinho@arm.com>
 <20230518105202.451739-4-jose.marinho@arm.com>
 <0969894f-d653-482c-f043-2a085ee3b404@huawei.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <0969894f-d653-482c-f043-2a085ee3b404@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2023-05-18 13:07, Hanjun Guo wrote:
> Hi Jose,
> 
> On 2023/5/18 18:52, Jose Marinho wrote:
>> The BBR specification requires (or conditionally requires) a set of ACPI
>> tables for a proper working system.
>> This commit updates:
>> - the list of ACPI tables to reflect the contents of
>> BBR version 2.0 (see https://developer.arm.com/documentation/den0044/g).
>> - the list of ACPI tables in acpi_object_usage. This last update ensures
>> that both files remain coherent.
> 
> Thanks for the update, some comments inline.
> 
>>
>> Signed-off-by: Jose Marinho <jose.marinho@arm.com>
>> Reviewed-by: Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>
>> ---
>>   Documentation/arm64/acpi_object_usage.rst | 81 +++++++++++++++++++++--
>>   Documentation/arm64/arm-acpi.rst          | 71 +++++++++++++++++---
>>   2 files changed, 139 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/arm64/acpi_object_usage.rst 
>> b/Documentation/arm64/acpi_object_usage.rst
>> index 484ef9676653..1da22200fdf8 100644
>> --- a/Documentation/arm64/acpi_object_usage.rst
>> +++ b/Documentation/arm64/acpi_object_usage.rst
>> @@ -17,16 +17,37 @@ For ACPI on arm64, tables also fall into the 
>> following categories:
>>          -  Recommended: BERT, EINJ, ERST, HEST, PCCT, SSDT
>> -       -  Optional: BGRT, CPEP, CSRT, DBG2, DRTM, ECDT, FACS, FPDT, 
>> IBFT,
>> -          IORT, MCHI, MPST, MSCT, NFIT, PMTT, RASF, SBST, SLIT, SPMI, 
>> SRAT,
>> -          STAO, TCPA, TPM2, UEFI, XENV
>> +       -  Optional: AGDI, BGRT, CEDT, CPEP, CSRT, DBG2, DRTM, ECDT, 
>> FACS, FPDT,
>> +          HMAT, IBFT, IORT, MCHI, MPAM, MPST, MSCT, NFIT, PMTT, PPTT, 
>> RASF, SBST,
>> +          SDEI, SLIT, SPMI, SRAT, STAO, TCPA, TPM2, UEFI, XENV
>> -       -  Not supported: BOOT, DBGP, DMAR, ETDT, HPET, IVRS, LPIT, 
>> MSDM, OEMx,
>> -          PSDT, RSDT, SLIC, WAET, WDAT, WDRT, WPBT
>> +       -  Not supported: AEST, APMT, BOOT, DBGP, DMAR, ETDT, HPET, 
>> IVRS, LPIT,
> 
> AEST is ARM Error Source Table, and it can be used for ARM platforms, so
> I thinsk AEST is not belong to "Not supportted", "Optional" instead.

Can you point to the code in Linux which does anything with AEST, 
optionally or otherwise? ;)
> and APMT is the same.
> 
>> +          MSDM, OEMx, PDTT, PSDT, RAS2, RSDT, SLIC, WAET, WDAT, WDRT, 
>> WPBT
> 
> PDTT and RAS2 are now used for ARM too, please move it to Optional :)

Ditto; as stated in arm-acpi.rst this is Linux documentation covering 
the interaction between Linux and ACPI. It is not some kind of generic 
ACPI-on-Arm guidance whitepaper. If and when Linux actually supports 
these tables in the sense of meaningfully consuming them, that is when 
we can document such support.

Thanks,
Robin.
