Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76435242992
	for <lists+linux-doc@lfdr.de>; Wed, 12 Aug 2020 14:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgHLMoV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Aug 2020 08:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgHLMoU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Aug 2020 08:44:20 -0400
Received: from smtp1-3.goneo.de (smtp1.goneo.de [IPv6:2001:1640:5::8:30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B874C06174A;
        Wed, 12 Aug 2020 05:44:20 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 2766023EF78;
        Wed, 12 Aug 2020 14:44:15 +0200 (CEST)
X-Virus-Scanned: by goneo
X-Spam-Flag: NO
X-Spam-Score: -2.773
X-Spam-Level: 
X-Spam-Status: No, score=-2.773 tagged_above=-999 tests=[ALL_TRUSTED=-1,
        AWL=0.128, BAYES_00=-1.9, NICE_REPLY_A=-0.001] autolearn=ham
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xO6akWVDbA9M; Wed, 12 Aug 2020 14:44:13 +0200 (CEST)
Received: from [192.168.1.127] (dyndsl-085-016-039-248.ewe-ip-backbone.de [85.16.39.248])
        by smtp1.goneo.de (Postfix) with ESMTPSA id B225123F0A3;
        Wed, 12 Aug 2020 14:44:13 +0200 (CEST)
Subject: Re: Documentation: build failure with sphinx >= 3.0.0: exception:
 cannot import name 'c_funcptr_sig_re' from 'sphinx.domains.c'
From:   Markus Heiser <markus.heiser@darmarit.de>
To:     Salvatore Bonaccorso <carnil@debian.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        LinuxKernel <linux-kernel@vger.kernel.org>,
        jforbes@fedoraproject.org
References: <20200408113705.GB1924@ArchLinux>
 <20200408132505.52e595bc@lwn.net> <20200408233450.GA14923@debian>
 <20200809132327.GA145573@eldamar.local>
 <20200812073059.GA509953@eldamar.local>
 <579fbb36-515d-5af4-f7dc-c092d29fddd8@darmarit.de>
Message-ID: <f14d2592-629d-0efe-a50a-fe3a6073c99b@darmarit.de>
Date:   Wed, 12 Aug 2020 14:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <579fbb36-515d-5af4-f7dc-c092d29fddd8@darmarit.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Am 12.08.20 um 10:21 schrieb Markus Heiser:
> 
> Am 12.08.20 um 09:30 schrieb Salvatore Bonaccorso:
> [..]
>>> The problem is actually related to changes happening in Sphinx 3.0.0.
>>> There is the followign issue filled upstream:
>>>
>>> https://github.com/sphinx-doc/sphinx/issues/7421
>>>
>>> 'c_funcptr_sig_re' was removed upstream in sphinx v3.0.0b1 and so the
>>> kernel documentation build fails. This is reproducible with a recent
>>> sphinx version (in attached case it is 3.2.0):
>>>
>>> $ make PYTHON=python3 xmldocs
>>>    SPHINX  xmldocs --> file:///home/build/linux/Documentation/output/xml
>>> make[2]: Nothing to be done for 'xml'.
>>> Running Sphinx v3.2.0
>>>
>>> Extension error:
>>> Could not import extension cdomain (exception: cannot import name 
>>> 'c_funcptr_sig_re' from 'sphinx.domains.c' 
>>> (/usr/lib/python3/dist-packages/sphinx/domains/c.py))
>>> make[1]: *** [Documentation/Makefile:115: xmldocs] Error 2
>>> make: *** [Makefile:1655: xmldocs] Error 2
>>>
>>> Distribution reports related to this issue:
>>> https://bugs.debian.org/963636
>>> https://bugs.archlinux.org/task/66178
>>> https://bugs.archlinux.org/task/66156
>>
>> As a workaround to make the documentation build again (but known that
>> parts of the documentation will be broken), we could drop the cdomain
>> extension.
>>
>> Regards,
>> Salvatore
> 
> @jon, do you have time to implement a patch?
> .. sorry, I'am in a hurry :o
> 
> In the linked github issue you find also a patch that fixes a
> cdomain.py.  I tested the patch (shee below) in the linux kernel.
> 
>    For me it works.

Sorry, I have to correct:

   a Patch needs more work

sphinx-doc has changed the way how domains are implemented [1].

-- Markus --

[1] https://github.com/sphinx-doc/sphinx/commit/0f49e30c
