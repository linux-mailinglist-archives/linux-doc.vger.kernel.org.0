Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF39778318B
	for <lists+linux-doc@lfdr.de>; Mon, 21 Aug 2023 21:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjHUTpo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Aug 2023 15:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHUTpo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 15:45:44 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727B1CC
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1692647134; x=1693251934; i=xypron.glpk@gmx.de;
 bh=iqCHCXKOO1iG+ysFWrqqs7rz/35g9oeTkQ26UArU7es=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ejNNQ3pXVbeuYLgHlDHELTy1JsWl/VtrLAv0cHF4Bska1B8z6B/nbhS8nU/mNpx33dQ/sv1
 RLSh0ZSaT4TfJhD1r8nr5V3yg6MUN208U1if99PKRvUqcXGjzVFBuO8bI9fXSDVmCghih3UeV
 zrJ6x0Yz5AI265CyIiepgucTjtIjd3caHQDbnQGT0/k1txRLPd3jsgFR3NlNgaEgF9Jk2AFoi
 QsdRealEee00AsuTMRc5jRLLAz0QMnciz/NGwkrTEWRRIYGIGeqgNgJV53hl2/+rLYFro7Xt/
 lFek70GiTheGb9Th/ozqnAj/U0nPW18sUSthuZGaAibi5fJ/S50g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.67] ([62.143.244.162]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUGiJ-1q6z3W3Mbj-00RLYR; Mon, 21
 Aug 2023 21:45:33 +0200
Message-ID: <66d25d72-4556-6085-064a-7f7cb79fa061@gmx.de>
Date:   Mon, 21 Aug 2023 21:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Doc style for method functions
Content-Language: en-US
To:     Simon Glass <sjg@chromium.org>
Cc:     linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        Jonathan Corbet <corbet@lwn.net>
References: <CAPnjgZ0vPwd9v+V8Pg5Bo87OELD-vokB7ZrvU3Bv5dQ_O9z6Sg@mail.gmail.com>
 <877cpusybz.fsf@meer.lwn.net>
 <CAPnjgZ3Lo4Na7YeKPFaY30bwsv_gBGapN_DXeab+k7yhCF3uww@mail.gmail.com>
 <dfac4932-7cbc-3a4e-bde7-c2048516ddf1@gmx.de>
 <CAPnjgZ07G=+QZU9+qT23x+aZw4VES0jNkXUTu4Axm400NF-hzQ@mail.gmail.com>
From:   Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <CAPnjgZ07G=+QZU9+qT23x+aZw4VES0jNkXUTu4Axm400NF-hzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BValcThMPwSVJHYiyNu04DP8lfKkgS3GwfAXbaMH0qXT0yma8pZ
 t9rEixAofv+zGUGyYryJop688DhKi7Yd8hDR4u8duvuCoHW+SSD9xSpeiHXJDY2wJB8zcfw
 Od6dfxnkhNeCbSq2ireJOWRB4KC9mekK0FOZqFfSkq4koSoIfGLSSR4jNRFsoC3SrPo/qTl
 xTtnKwsyuNQBDqTpW3lWA==
UI-OutboundReport: notjunk:1;M01:P0:Wu2NKnCj2Q4=;a2J44LizWt7ZpqPDjFd1qsGW6n7
 5JsplRubC+nmjZ4tB6wwoCT/Db4OOgQQlSg/nW+LIoTJh+Df2prwAI0sEMZVuDLJxRkCEcr/y
 WFmx7VrWa3daDt2YPm37mD2qPC0C0t8qWPC5LtDWOfclrNNaLZt/HGtbdCzMZXv7TzSKlLlt2
 brm5/zqHC7iJDDOuXbYHo06aLgVjhfwMZv2T+icUz2z8CD70agU4nF83J25mwZ+PyG7mM++3U
 ZfG9QNv3phUif1yduwFjNEl+40Qs+rYylhkwvOQyYvX3Ar0yYkytoEt+rspTwdzVQPicP05s+
 UxylK9auTlt2Xy5NIyS2eRQnIf+RX459oOVEo/kxYPCNidILO/z8vvWY1kHTauGTawFkKS4W+
 8q/6Z4a/2HGDPVaKEHCLbqLoyCDAtdzbzum4dnaq4u+rsG3aD4JPx1FWXzjOB2xxfo5fFjdrR
 uoQglNV3y+eGOQyrn8noENLa4BFm3GetzSf9Qm7eLQj7PR+cSNyf2QTnRdofLpG3Ub8ikuPah
 sWzxw3sQZNO7P3O2OMXVYF6B5A3BbG3didscb3eloEDX+1pMgWg6rqg46Rcg00nXEWve8QVKE
 8KghfZ7UTogH48WlRWcVwdUcFkKuzic5gx3B566ocJlIrgpY6GtZKTvKniWv8e8G3E4KaSkit
 TAPuQ8yJ4I1DIJWMHD52/A+kmeadwnsX/ceO6Ut7jTGdFm0QB8owQETuHVJrXimN6ltwxFy3y
 H2jcRaHUpxBm1zea1nWqsW00O3Cpzl4qlJymyAqjhLOJoNWqi1IsCoQiVYnv13nJ18ClHICyk
 oq2XUpZyuSfV6MyJqa7m/1FC5xyomvmRTF4+wQXZmajoySc8c7dsenqE5em+/6spSuczhyjRF
 QSAj2wf9xEOsr5Cmbb38BpT0Sl/J2sGJf/vL6OxinXc/Fl0kSiYh62EZqh5/5wJhPKBVIHdI6
 2isB/r6VoiquKYF1FTugQh/XRuE=
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18.08.23 16:59, Simon Glass wrote:
> Hi Heinrich,
>
> On Thu, 17 Aug 2023 at 10:36, Heinrich Schuchardt <xypron.glpk@gmx.de> w=
rote:
>>
>> On 16.08.23 19:47, Simon Glass wrote:
>>> Hi Jonathan,
>>>
>>> On Wed, 16 Aug 2023 at 11:15, Jonathan Corbet <corbet@lwn.net> wrote:
>>>>
>>>> Simon Glass <sjg@chromium.org> writes:
>>>>
>>>>> Hi Jonathan,
>>>>>
>>>>> I would like to do something like this:
>>>>>
>>>>> struct part_driver {
>>>>>      /**
>>>>>       * get_info() - Get information about a partition
>>>>>
>>>>>                 ^ causes error
>>>>>
>>>>>       *
>>>>>       * @desc: Block device descriptor
>>>>>       * @part: Partition number (1 =3D first)
>>>>>       * @info: Returns partition information
>>>>>       */
>>>>>      int (*get_info)(struct blk_desc *desc, int part, struct
>>>>> disk_partition *info);
>>>>> ...
>>>>> };
>>>>>
>>>>> But this gives:
>>>>>
>>>>> scripts/kernel-doc:292:
>>>>>      print STDERR "Incorrect use of kernel-doc format: $_";
>>>>>
>>>>> Without the brackets on get_info() it works OK. What is the purpose =
of
>>>>> that check, please?
>>>>
>>>> That's how the kerneldoc syntax was defined, well before my time as t=
he
>>>> maintainer.  This could be relaxed, I guess, but one would have to lo=
ok
>>>> at the parsing code to be sure that the right thing happens all the w=
ay
>>>> through the process.  I'm not entirely sure it's worth it...
>>>
>>> I see. It is inconsistent, since we use () after normal functions.
>>>
>>> I think I can fix it just by removing that check.
>>>
>>> Regards,
>>> Simon
>>
>> If the structure element in not a function pointer, we probably still
>> want to forbid adding parentheses. Just dropping the check might not be
>> the solution.
>
> Is that the purpose of this check? Is it likely that someone would add
> a bracket immediately after a variable?

We don't want anything but a colon ':' after a structure member name.
This excludes white space, parentheses (), brackets[], and braces {} and
a lot more.

A structure member name relating to a function pointer should be the
only exception. Here we expect the parentheses and the colon to follow
immediately without white space.

Best regards

Heinrich


>
> Regards,
> Simon

