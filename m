Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2290655F5E6
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jun 2022 07:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiF2F62 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jun 2022 01:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiF2F61 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jun 2022 01:58:27 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395EFB39
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 22:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1656482305; x=1688018305;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S274m18N48qoB/3JOPWD2zir1wX7NK811KrJ3AY/WxM=;
  b=HOYDLryiGLMpCGUMYD27x/r+KMN3btvGMpH7fUS9gsMw6/LM4PkyOieC
   NU8z7sbYbtXhv5ISqHTxgqFe/O2GXUq7RnnoajBGZ75v69Caj7B8cxDnv
   7jywBubKdOmTOaPwzTKrGYrjsYIjc3kULh7OfST4Ozs34+PNT/nD9OofV
   bTB7lnsvpSsRYxJOWNZWt+K0zRL5ro/aiHZnAB3XS+m/N2Ad9xwTf6+5T
   mmbj4KJROyFhRaJwg1OcqTCwCh8Z1P62C8KlVphQGvx/IU+T+YHPmvkYP
   TYVw81RnxC+cs+tpDRy4t/I5mjFYoMDHvPR1yajwPszXktBx2BP+qwG2x
   g==;
X-IronPort-AV: E=Sophos;i="5.92,230,1650902400"; 
   d="scan'208";a="209228638"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2022 13:58:24 +0800
IronPort-SDR: g8cUFxZpHT5d9XxqPqh1eC07duNY744YCihX5v8XrTQ2yP7ayLOxx2tgD45BB54vclidbQNzVK
 Vuq/R0kF1EGFjiXX/MLLHQLMmhFsen5+naf1G2rgbmU5sT8dHegjEo2jHerFtn1kz6GFedZGef
 9i/1ylAsiUMA3Ef+R2klm2nlieCPMfV672YwU0F02c5MwEiuA9mSvpU/wz6v/YiIWJRiPjZW4u
 lNy0034SOCDD1R2okgMwt0mrOPi8vBDpeqXi44ljSZgJxySK1aRgxe0oEMNev5NuDvGUFXuA8j
 i31xOmfNJ6jztTTJ3X7lZWgr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2022 22:16:04 -0700
IronPort-SDR: 7M1IxQjSbub1M17WWVGkXgyQNR2xYBs50pz7mZdFTOk7i/hyS5R8i4lEOyLWJoh6OHJhI76BCd
 k0PeHWJs5tbaI7fJeTEMzwjx+jKWLfvhOwqrUE7/v/826t3s24nx7NjH8w0kyzuxcKP55k+/XB
 W85Wuq7K/6EFpI3FhaivFWXXOB7emg7y4ZOmE28jYXPBPsbQvYyKMHg0qZWnFxI2tBI2TVv+hB
 sU5w+Z56ETfTP86jXn3Jr0kxC4Npqp8vfX+d8CWCJCKLW1QSPo9gAzOaXYe+8sACVTV6MA1Tez
 Hfk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2022 22:58:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LXrNx0fN3z1RwqM
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 22:58:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1656482304; x=1659074305; bh=S274m18N48qoB/3JOPWD2zir1wX7NK811Kr
        J3AY/WxM=; b=rZSIxcVazCAwPnit7YiDg5OgUpZgn7oq63L8f4Mx5qqJilG9g8G
        wV5uGQC6JZ3YwlD5RcmYm+uC8m3errnlZAgp6o7+Qhr7ybMyItuZdVnuPUQq8QEd
        alfGKsPbawfDl8vhSXqv7ElY5MHblK270Sv+iK4DJTeh1yOW4yY6pE1FPc0SsVS3
        eEbW6uvondPnaorxx3Tv8sUCSOfC7y2rkIguFVW4kiJALFQpstNM3YhM+lm0p4Sk
        NjgP4mO0z1H7lo92riFs/zobGTmMpBKf5xdH7qdMRzGY7ovcG58VHmy0idD2F4km
        cXLdBqiqjM+YDQfvAyxED73TZ7AcaTKdhxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id wWg12x9swMwe for <linux-doc@vger.kernel.org>;
        Tue, 28 Jun 2022 22:58:24 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LXrNt01D4z1RtVk;
        Tue, 28 Jun 2022 22:58:21 -0700 (PDT)
Message-ID: <da7027d9-bd81-cfb0-f70e-2405f40023fa@opensource.wdc.com>
Date:   Wed, 29 Jun 2022 14:58:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 5/5] libata-scsi: Cap ata_device->max_sectors according
 to shost->max_sectors
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>, John Garry <john.garry@huawei.com>
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
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220629054027.GB16297@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/29/22 14:40, Christoph Hellwig wrote:
> On Tue, Jun 28, 2022 at 12:33:58PM +0100, John Garry wrote:
>> Well Christoph originally offered to take this series via the dma-mapping 
>> tree.
>>
>> @Christoph, is that still ok with you? If so, would you rather I send this 
>> libata patch separately?
> 
> The offer still stands, and I don't really care where the libata
> patch is routed.  Just tell me what you prefer.

If it is 100% independent from the other patches, I can take it.
Otherwise, feel free to take it !

-- 
Damien Le Moal
Western Digital Research
