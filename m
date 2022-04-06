Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E02554F5E22
	for <lists+linux-doc@lfdr.de>; Wed,  6 Apr 2022 14:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbiDFM0U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Apr 2022 08:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbiDFM0C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Apr 2022 08:26:02 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826AC3F9E90
        for <linux-doc@vger.kernel.org>; Wed,  6 Apr 2022 01:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649232651; x=1680768651;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OXlW7XMsm7YkB8BmULX0rKO6acP3cTihzhxzw0jjfqc=;
  b=kcN2TUI/+EzjGey45MWuvNtbkq0FK4bRBy9dV160jhDrxzn9yNsH5bj4
   B7bfiPpKquM9Nnnfby3+8b841JgC8BxezPhc82pfaIJG455O04Uw+rBHM
   IWFSgEcDDI7QJ8jNYoGa7yKsB3Jr6e57RylVXv4pC8n+firxQGPWtbJnT
   3h2ii8hyO0yFc+3q6vSQHEb9b/5x2JRR4h8tviHeuM5b2QPCICMg2rWxN
   U9aYJUybM+kw6hQYFlzo8gRvh1edjR4UJIA0GAqQCBtpQOe2DkcUFhPMw
   M6bB0ZMfrdSOBvj0tAdhwvuRX8fVA2iibTJOq7eR+zwiA4AtuMOPi12wg
   w==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; 
   d="scan'208";a="197220760"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 16:10:48 +0800
IronPort-SDR: JhnRQTXvUAPDOi9yRjGbQh47sByupLArqIXceu99snTxfRKI7ntezmd7cMZfGwjfLUvYU1Da9h
 wj3cCRCc/bujlyeXXbRwwoL6ZnPKXz0YY/nkMOfsXUTBpCOnRC8SmhOqF5F7Qqd0GexHq8LZJy
 fO7VYQSb+MUrjue2Lx1GYc+VmmSuTK+M0CJPFzwZz2m9NfcPUSJKphkdrCZGFtEWb+ugTAIg+5
 em6G4Kgf/31tYIVQ6RPh+S8MyzkqYkZPAC2FhYbZQ09Lp5rCJPQRIN9BNThaZMKbIm9Py1KZ7C
 fGpIJELq3etI2Mb0D1UGDqEN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Apr 2022 00:41:30 -0700
IronPort-SDR: pkzrX4uIdTN/g11b9iwtTFYr4oYtHllNBrx5eHcBj854avSLjHp/UDmeB7z9ibHfq945HuznWq
 8X+E7uhENmvNy/WYmtk6f+kEXtkMqzHFmtSaGgN16IF5fOzERBp+kjbvh3dcl/L1LT4/ZBTx3J
 Onk3ABkzO30xdOhM+vSc8m+d171Nh9FqfFB+6oPnxkSNd2dZIQw9O2DKEHZkUq2qZZoztXWz33
 +WUxcodmhqe+6q/McsZ2LZjKiA7Ax+McNp9f0NTi2R/+K96d83oYWDEhXnOgw2xEpIUQJyuy9J
 5kQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Apr 2022 01:10:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYHJS323Bz1SVny
        for <linux-doc@vger.kernel.org>; Wed,  6 Apr 2022 01:10:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649232647; x=1651824648; bh=OXlW7XMsm7YkB8BmULX0rKO6acP3cTihzhx
        zw0jjfqc=; b=o4BCjSaKcmUeC3V/ysxboezAk7mt0Fxzqh0MWkY8sT2l+gU7jPB
        Kdld9C6XDIdwdhu6MiqU1d/sFMaFZp1s88kGT8889lanvnwC5C8AIwciYM+n0oHv
        v8DNdpfzNAnjxkMmWc8SAOte06L8HEC5Aaq0RJ3++HsG5s0JRjox/1O/RVWyl8QV
        csjgkizdLNStKiwYAn6XM9sdJYrB3kTdTlk3xh1VqjcLqZnatbHvvIiBNcoawOPo
        TlPhnPSSi8mM80a14xE+5tRgZNdUKq+STK7pG4aKau780AYeHKeAm1wTs8z6wem3
        vskcmDgDMic33lD85Uly6zeGQTyojauhR1A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ehDFtn4Y-3JO for <linux-doc@vger.kernel.org>;
        Wed,  6 Apr 2022 01:10:47 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYHJR0CwQz1Rvlx;
        Wed,  6 Apr 2022 01:10:46 -0700 (PDT)
Message-ID: <a984b4d6-bc7d-ef81-8bd6-34d50127174d@opensource.wdc.com>
Date:   Wed, 6 Apr 2022 17:10:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] libata: Inline ata_qc_new_init() in
 ata_scsi_qc_new()
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, Christoph Hellwig <hch@lst.de>
Cc:     linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org
References: <1649083990-207133-1-git-send-email-john.garry@huawei.com>
 <1649083990-207133-3-git-send-email-john.garry@huawei.com>
 <20220405055252.GA23698@lst.de>
 <f7bbb09f-562f-fce2-cd16-a1c67fc334b5@opensource.wdc.com>
 <febb03e4-ea1d-c7e1-58a6-fa564c902af0@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <febb03e4-ea1d-c7e1-58a6-fa564c902af0@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/6/22 16:16, John Garry wrote:
> On 06/04/2022 02:48, Damien Le Moal wrote:
>> On 4/5/22 14:52, Christoph Hellwig wrote:
>>> On Mon, Apr 04, 2022 at 10:53:10PM +0800, John Garry wrote:
>>>> From: Christoph Hellwig <hch@lst.de>
>>>>
>>>> It is a bit pointless to have ata_qc_new_init() in libata-core.c 
>>>> since it
>>>> pokes scsi internals, so inline it in ata_scsi_qc_new() (in 
>>>> libata-scsi.c).
>>>>
>>>> <Christoph, please provide signed-off-by>
>>>> [jpg, Take Christoph's change from list and form into a patch]
>>>> Signed-off-by: John Garry <john.garry@huawei.com>
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>
>>> Although I still think merging the two patches into one to avoid all
>>> the churn would be much better.
>>
>> I agree. Let's merge these 2 patches.
> 
> I'd say that they are distinct changes.
> 
> Anyway, if that is the preference then who shall be the author? 
> Considering I did most effort I will be and add Christoph as 
> co-developed-by - please let me know if not ok.

Works for me.

> 
> thanks,
> John


-- 
Damien Le Moal
Western Digital Research
