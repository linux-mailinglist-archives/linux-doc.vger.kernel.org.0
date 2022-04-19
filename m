Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAEA95065B7
	for <lists+linux-doc@lfdr.de>; Tue, 19 Apr 2022 09:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349289AbiDSH0N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Apr 2022 03:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349296AbiDSH0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 03:26:12 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68135326ED
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650353012; x=1681889012;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5q6ejJsAwDqGhvfNrIoUldza8bq8vgRsQq3ufZ74D4Q=;
  b=hjoWx0oI8cvEyoyYL3PyFtjufYTIiUoMA6hwkCpfBGXlmAu5SqO0hGF0
   q9jhg0pUM6+vqFCEeL+4xDrUxKMMNXPIJN2/rbLZzqoNs8AYbp4Php89w
   5GipM46s8CHd2VBbvdhFx49q5ZCjn9zq/0WwzhgpgBktlmGDQX9uRvytt
   KBF2qgprU2R9DCPC+FgynayD6EhO4+uyYkfGjxmp14V5EtNFxvar+1cK/
   NCoK4t89v9qP0ZoN+bBwFA5M/8oZR+cLr4uw3Ghw2uDR22iER2lfo0Kd1
   cApPLpLcp1mrM/coZ2TRGBc5ZmakFZE06F6tQgKgWSxpiDDQgQWYlG6Uo
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; 
   d="scan'208";a="199136473"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 15:23:29 +0800
IronPort-SDR: zv+dhbKoCZh1y3IXz/RMKiN5blRK+JdVEl2Yvobd/o06b6tIE1/2UZXFUZHdbNYC337y8FtK0b
 C072Kl5TnCU9K9MaW6jRdVfFFGor5FhL3R2g7P15azDQ0+yMjxXpepDS9KL2xOjRA2NU7LrQMj
 Z82eoEDkSOTxFK1bYXmODYE/iWp33hyzIqBJ6X1ZnSxr1VCPAA8hMONYerCxDPVUyQGW9c8AT7
 /2PCFOfFCBxz/Q7QhtpVJ+XjTmKgZZzsvN6QPAyRAJc1PLBFrCaJjT9j4QpWEh+m+L2tCTIr0+
 WEkC9noV/rkKYlh5G361i6Zw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 23:53:48 -0700
IronPort-SDR: um8d26X1A7CTqnXpcbVjZsFqu02qRL23RfbC24sTtIEKw58BVi8Y02lL9cfvIGOkWBokMmeQZk
 mjaAf5QpnxWy8489FU6XZXXWSAzErk4pI7LOAnJJWb+FDu2TEaq74qe3s3Ei5ACgAHSdcPG+sS
 OAkuRCEF1bEvMg/12RcRVe5gLro0gpdJp+zFTB/ja451BwtXr8kcd0MMCqTf83o8WL1YhzDik3
 6oVBZFcOS5Ml7hGaCjVRb9HdH10QFGyGS12+iUn5HxgFkIfKMevwItVjAA0/eJ3x0TP4PxFhWN
 Ges=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Apr 2022 00:23:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjFdr2MfYz1SHwl
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 00:23:28 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650353007; x=1652945008; bh=5q6ejJsAwDqGhvfNrIoUldza8bq8vgRsQq3
        ufZ74D4Q=; b=l/mPfd0dHdA8ebEy6wxXFlLGfDugyEpGaNTe+BbuR/j8LO7tpmd
        fzQNS0BFAygkGlYOHxCqzxpm7IbR+PkEyiRCaso9o6KjVLAVS7xiqTzHy63jxOPF
        Gx4EQ4pgQnyosSTrkcMCIIQVMorWGoAn6mwibIRXisHT4YBLMEjm/NkwWDYHDp8Y
        lUvB8ICJM2qk5v53NPT8sEFaUpflEcSotr43hfdSMCUZlSYFJfu+JLxgSc/lP9Sm
        4WB2iD6udT0dmCGQUEvTBeyWv9rFUhFFrGTt89GwsLkYsvlCk+KsbZgcpnxtK3A7
        zs5o6WRmWh0FEZdvwIF+SdHJjyLJRFQ5B2Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id w9ym81AghbbT for <linux-doc@vger.kernel.org>;
        Tue, 19 Apr 2022 00:23:27 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjFdn5gGKz1Rvlx;
        Tue, 19 Apr 2022 00:23:25 -0700 (PDT)
Message-ID: <851c5e50-920e-579a-717d-10284abd4d0a@opensource.wdc.com>
Date:   Tue, 19 Apr 2022 16:23:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Drop Documentation/ide/
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-block@vger.kernel.org
References: <20220419011021.15527-1-rdunlap@infradead.org>
 <7991758d-16b4-c9c4-0425-c2ec41943db8@opensource.wdc.com>
 <87ilr5zgj2.fsf@meer.lwn.net>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <87ilr5zgj2.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/19/22 16:19, Jonathan Corbet wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> writes:
> 
>> On 4/19/22 10:10, Randy Dunlap wrote:
>>> Drop all Documentation/ide/ since IDE support was deleted by
>>> Christoph Hellwig <hch@lst.de>, Jun 16 2021.
>>>
>>> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: Jens Axboe <axboe@kernel.dk>
>>> Cc: linux-ide@vger.kernel.org
>>> Cc: linux-block@vger.kernel.org
>>
>> Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>>
>> Jonathan,
>>
>> Are you going to take this patch or do you want me to queue it through the
>> libata tree ?
> 
> I'll take it, unless you want to carry it for some reason - just let me
> know.

No particular reason for me to take it. Just checking :)
Please take it.

Thanks !

> 
> Thanks,
> 
> jon


-- 
Damien Le Moal
Western Digital Research
