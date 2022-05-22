Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC4B530685
	for <lists+linux-doc@lfdr.de>; Mon, 23 May 2022 00:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351839AbiEVWWp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 22 May 2022 18:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351767AbiEVWWo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 May 2022 18:22:44 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83AD239816
        for <linux-doc@vger.kernel.org>; Sun, 22 May 2022 15:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1653258163; x=1684794163;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=g7+JeN4wnrl6dFXGk3nhuKNxU3bxTCBHH+iqteHxNFE=;
  b=VU5jWRb9PQwvnpiFN+lGW3EeTH3we4g9J+h04Ajzl3oNcpRUkPWM0xz9
   CjCS8V+k8GNDqNLOGdt9Sf4nFfqR1mLMP/nWvVupvbaHUcZg5d90L7GuX
   giNhdaU2vZit2dnlya2Pc9qmezTWvu79A4v0jHWcaPdL2yUWRlpyPNu4i
   npY1dJU5IS4qk568Bj6W3VkFT4QYNSAkLtaOmwZMO4ZiymxxbA4VD+xe6
   kiGqUsaknB6it9a34xTvzWwM2pDMzatEiJaXiwX9oZjh0S+Zl9dxktb3/
   2PZkV2e3PF0yhuJ0EpAgtU9auwNboEJWcbaBPtpxiEg4nNUG4qt1/w7c/
   A==;
X-IronPort-AV: E=Sophos;i="5.91,244,1647273600"; 
   d="scan'208";a="305310284"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 23 May 2022 06:22:41 +0800
IronPort-SDR: iYRdO5m5RYEoJFathojRLfi2YyjsJ8+fiABiNOD+ULFrDkkc0CmlCMj3fY5wOYBlMclEAWsaRF
 rZRYrl3Ym4ncGusDhmwP2D2sLtX4s9UDnzv55G9DPwe0Hp6zloOeHvk638+x9x9lzJ9F2DySXB
 vSbVKxmyxVUjQozOzycv0AMjz/6zJA8f7fBwmhPOYyTr1k7cEwqmPMYG9figmMqp7Ba+gLdjqV
 s2iINpOsElXPzjHar/2g2Zju18D+Gy8cJYENEV4gNStw+WRGJtN3kTf1+Wr1wVEt7GhIrXOrKl
 fL8lhoLDDszJ32ClUvZMnlAZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 May 2022 14:42:16 -0700
IronPort-SDR: sqN3mDK5edJZfEXlUFUrHbgXK37hvMN9VGb93kfSeCmf/8Gwsxu1b5Qfppa0qAeb+b+eL3iw6b
 LTnUMUZ2Q+2KDu7G4yEn4xi4pONHwcHpjkliDdCzBtadkRALmKh5zQ4tLSZUb/qDckMPbyn+O4
 i1uq+aJNmar1Z0c3xU/i1DYoB1iW9HxpHU9LkHDsXxpQ/R1VP4fqBIeOWo1NtN2WBmLEiXdT+N
 sK7ZqxquBnJppaFI66LenzKBISWFHGLAdsve3rZMKqKorXwHgKxwMp929HAvCjUT47fh3R+LKm
 we8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 May 2022 15:22:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L5w283TkNz1SVny
        for <linux-doc@vger.kernel.org>; Sun, 22 May 2022 15:22:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1653258159; x=1655850160; bh=g7+JeN4wnrl6dFXGk3nhuKNxU3bxTCBHH+i
        qteHxNFE=; b=cFP8EjCWYzIn0k4ie3WKPohm2MCo0AumuYqBQTKCtVbOnF5ahgC
        3DMD77wHEBGNIby9QYVO8Kyj8ThYO13/AhkkmwvMo1hw6M+usps0UivIXgCdZseU
        9A6F5n+Fh6VrhIr7wexiIbbqwP/tasyeStlJ/r5Q78CNt8JpJvfsexJ4TyKQTbY2
        aY7WAwIjYDT4mh9L4oSbx4j06Oa3+BPww0WpgkiA5gn05hxU90tfn4OZw+TdYdiC
        O82vY1I2LjR+sEaV1nVlyE1A1wP+OTnEVYJ/WTGpbJJtbREAsy8XMVCmYRSC0I1S
        oStpPqSyJ5iYY82wZ98GYO9okFFzZCtC3dw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XAkpCA_sZiQF for <linux-doc@vger.kernel.org>;
        Sun, 22 May 2022 15:22:39 -0700 (PDT)
Received: from [10.89.85.73] (c02drav6md6t.dhcp.fujisawa.hgst.com [10.89.85.73])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L5w252KbGz1Rvlc;
        Sun, 22 May 2022 15:22:37 -0700 (PDT)
Message-ID: <15f94ea2-fa97-3122-60dd-a87a3dd8a7db@opensource.wdc.com>
Date:   Mon, 23 May 2022 07:22:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 0/4] DMA mapping changes for SCSI core
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>, John Garry <john.garry@huawei.com>
Cc:     joro@8bytes.org, will@kernel.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, m.szyprowski@samsung.com,
        robin.murphy@arm.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-scsi@vger.kernel.org,
        liyihang6@hisilicon.com, chenxiang66@hisilicon.com,
        thunder.leizhen@huawei.com
References: <1653035003-70312-1-git-send-email-john.garry@huawei.com>
 <20220522131345.GB25785@lst.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220522131345.GB25785@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/05/22 22:13, Christoph Hellwig wrote:
> The whole series looks fine to me.  I'll happily queue it up in the
> dma-mapping tree if the SCSI and ATA maintainers are ok with that.
> 

Fine with me. I sent an acked-by for the libata bit.

-- 
Damien Le Moal
Western Digital Research
