Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7687055FA5F
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jun 2022 10:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbiF2IYu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jun 2022 04:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbiF2IYr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jun 2022 04:24:47 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E96F3BFA0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jun 2022 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1656491087; x=1688027087;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AjhPOFbRCAVVpWITsrOe0anHqorsbYYstfbAHDzMisE=;
  b=gvK/hMMoCQzlLKFCfplNXXy7dQoKoRUlC6tlK/i7FB4EgaIlG7BjPQK7
   pJql7U+0cEdZozEmKWkh7DBkaI4eJEJgkaUvQU5bNxz3E1usvXxUxPxqR
   S6KXfvnxe0ehxRKTHd7TyYFdl7j94JjirNQKEWVXXcDNAP6mP5weAe/d7
   PyfNXBMCPc00RL1TZ6WaX6OYeQRb08MbmAFY7xT5STBGz7u5AMOtjD+08
   Ag4TaF58Jl+v33PkNLlmK8ZiMRJ3MjjwcO7ibSFksHeCJGQR2TikBbVIO
   JOdG57cMBST4/Mt7mdvGZo7Ken2wQh268zs6pUmDA4qyu+PLn8i/SLGIS
   A==;
X-IronPort-AV: E=Sophos;i="5.92,231,1650902400"; 
   d="scan'208";a="308690112"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2022 16:24:45 +0800
IronPort-SDR: hlbIKKMSxvLnF9XQP6E1gzXkuYfxg2dGacLoVaflUjqqZ+7VaSV5iWS+xSmY28Ic2Mrhevn010
 6QuUbD5i3KPcbaM5u3IF70SwhrI3IwKXhUs6DiWen7oIAEQIAhQ/87Viqd5wRKzpWT+IfvhiBV
 PIWQLNh6FjRimc5qd5eiWLe4QTOV7yRNqRx4O4ixAt4wJFqWh7T/8I1M/snocywf7I48Ku23pn
 IrHJI019z2zltDL9V1lqzESycEat4ja5FaaVZiF4BJ/FJ0HA4cCzC+k1+4YIv+zaHx8odNM7uj
 hR62dUnEn0GFOeUWXGLF37wI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jun 2022 00:42:25 -0700
IronPort-SDR: ILVnqyc/ALR2e90grJCPA32o68iHBPx1QDS7h7J7ksxWyL5f5qJJXAY22288Hm7a5jFqb9QwXH
 7bWdunuuILZP/5mv0EjfiCT5j74ZGEBrBZMXXws3CgDYtiGaJMDTgOZsQzrp97NjSBKGBzDBt1
 7GVcICRo+ewIcOCM3Pd6rw0D8Zovknfpn44f8VSUpZ3XwvKBC8eDCPBw3455Lr8MK9TaSbprVf
 frhvxGNRWxtZR/1gGEW1DrNCqLOJFo1tH61kK+2cXdppZI9Succz7nWrwpb++m/UiKgd+WCW1d
 nJQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jun 2022 01:24:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LXvdn0t6Rz1Rwnm
        for <linux-doc@vger.kernel.org>; Wed, 29 Jun 2022 01:24:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1656491084; x=1659083085; bh=AjhPOFbRCAVVpWITsrOe0anHqorsbYYstfb
        AHDzMisE=; b=f4KMrv0T558Vn290lglMeOnpRgM/tnLvwyasnRINiD6TD/Cc1Hc
        2yomsmv8LfVntiQ7GXFwUkCfRKRAY7qvGQbkr9P1QpY/SYkkhIoX2LD0FC1C2S7j
        5si/YK0AAM1giKgqSsMmuK7/eOFgxGgmu2nZwiCk1O/ge2rzdrkXU52ICY3spbY6
        al3z0VVWsrrfQhOpr1vl5fJenrtuK4YXLxrGgFIA4KlKFbVZ9jukOl66Ax7MYsR5
        h90n0fF4NTKu5YdmMllJMqVq5Okh07VYSGcgxkqxLsX07uF0iihUuG4Eot0/wlLO
        x+B//BwgzWidtwSG/6bzg0Q9vSt9imHiHdA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id t3EGWbGQreyy for <linux-doc@vger.kernel.org>;
        Wed, 29 Jun 2022 01:24:44 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LXvdk2Vfxz1RtVk;
        Wed, 29 Jun 2022 01:24:42 -0700 (PDT)
Message-ID: <bf9d1cc7-c03d-f5a8-bb96-cfcd352ac36e@opensource.wdc.com>
Date:   Wed, 29 Jun 2022 17:24:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 5/5] libata-scsi: Cap ata_device->max_sectors according
 to shost->max_sectors
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, Christoph Hellwig <hch@lst.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, iommu@lists.linux-foundation.org,
        iommu@lists.linux.dev, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com, joro@8bytes.org, will@kernel.org,
        jejb@linux.ibm.com, martin.petersen@oracle.com,
        m.szyprowski@samsung.com, robin.murphy@arm.com
References: <1656343521-62897-1-git-send-email-john.garry@huawei.com>
 <1656343521-62897-6-git-send-email-john.garry@huawei.com>
 <b69c6112-98b7-3890-9d11-bb321a7c877a@opensource.wdc.com>
 <6619638c-52e8-cb67-c56c-9c9d38c18161@huawei.com>
 <ba59a0da-a982-e3eb-1cb7-6e60f80fd319@opensource.wdc.com>
 <38ae1cc8-1411-bb54-e082-0f7b91cb9e63@huawei.com>
 <20220629054027.GB16297@lst.de>
 <da7027d9-bd81-cfb0-f70e-2405f40023fa@opensource.wdc.com>
 <65e05dd1-8e92-5f6b-d68e-72987fcebf59@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <65e05dd1-8e92-5f6b-d68e-72987fcebf59@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/29/22 16:43, John Garry wrote:
> On 29/06/2022 06:58, Damien Le Moal wrote:
>> On 6/29/22 14:40, Christoph Hellwig wrote:
>>> On Tue, Jun 28, 2022 at 12:33:58PM +0100, John Garry wrote:
>>>> Well Christoph originally offered to take this series via the dma-mapping
>>>> tree.
>>>>
>>>> @Christoph, is that still ok with you? If so, would you rather I send this
>>>> libata patch separately?
>>>
>>> The offer still stands, and I don't really care where the libata
>>> patch is routed.  Just tell me what you prefer.
> 
> Cheers.
> 
>>
>> If it is 100% independent from the other patches, I can take it.
>> Otherwise, feel free to take it !
>>
> 
> I'll just keep the all together - it's easier in case I need to change 
> anything.

Works for me.

> 
> Thanks!


-- 
Damien Le Moal
Western Digital Research
