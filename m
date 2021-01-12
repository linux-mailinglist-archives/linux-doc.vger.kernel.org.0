Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46AA2F260B
	for <lists+linux-doc@lfdr.de>; Tue, 12 Jan 2021 03:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbhALCHV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 Jan 2021 21:07:21 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:40433 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727284AbhALCHV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 21:07:21 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0ULTjn3m_1610417194;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0ULTjn3m_1610417194)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 12 Jan 2021 10:06:35 +0800
Subject: Re: [PATCH 1/4] doc/zh_CN: add mips index.rst translation
To:     Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210111113401.2852455-1-siyanteng@loongson.cn>
 <20210111125724.689a7765@lwn.net>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <6f4c0e94-7a1f-d30d-51d3-5adb9d6498de@linux.alibaba.com>
Date:   Tue, 12 Jan 2021 10:06:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210111125724.689a7765@lwn.net>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



�� 2021/1/12 ����3:57, Jonathan Corbet д��:
> On Mon, 11 Jan 2021 19:33:58 +0800
> Yanteng Si <siyanteng@loongson.cn> wrote:
> 
>> This patch translates Documentation/mips/index.rst into Chinese.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>  .../translations/zh_CN/mips/index.rst         | 29 +++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 Documentation/translations/zh_CN/mips/index.rst
> 
> So I am confused by all of this; I've received a few variants of this
> patch set; this one is not threaded properly. It looks like Alex reviewed
> some of the previous versions, but you don't have his Reviewed-by tags
> here.
> 

Hi Yanteng,

You could resend the 1-4 patches as a new thread v6 version, all with my 
Reviewed-by.

Thanks
Alex

> I will drop these; could you please straighten this all up and send me a
> version of the series that is ready to be merged?
> 
> Thanks,
> 
> jon
> 
