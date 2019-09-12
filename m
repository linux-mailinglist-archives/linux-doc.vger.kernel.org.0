Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E2CB1619
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2019 00:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfILWJY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Sep 2019 18:09:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48546 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfILWJY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Sep 2019 18:09:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 5C3A728A2EC
Subject: Re: [PATCH 2/3] null_blk: fix module name at log message
To:     Jens Axboe <axboe@kernel.dk>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, m@bjorling.me, kernel@collabora.com,
        krisman@collabora.com
References: <20190911144636.226945-1-andrealmeid@collabora.com>
 <20190911144636.226945-2-andrealmeid@collabora.com>
 <a02d9e6d9c13a607bc08b71a5d5f6c2039f1c279.camel@collabora.com>
 <943a2fc3-4812-cc41-bdff-be13ec319257@kernel.dk>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <baa7de0c-54fc-5698-a9d1-2ee68e622fc7@collabora.com>
Date:   Thu, 12 Sep 2019 19:08:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <943a2fc3-4812-cc41-bdff-be13ec319257@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/12/19 5:47 PM, Jens Axboe wrote:
> On 9/12/19 9:47 AM, Ezequiel Garcia wrote:
>> Hi André, Jens,
>>
>> On Wed, 2019-09-11 at 11:46 -0300, André Almeida wrote:
>>> The name of the module is "null_blk", not "null". Make `pr_info()` follow
>>> the pattern of `pr_err()` log messages.
>>>
>>
>> Instead of doing these fixes manually, it's more consistent and smarter
>> to use pr_fmt. There are many examples of drivers doing that.
>>
>> I don't know if this patch can be dropped, and replaced with one used pr_fmt
>> or if doesn't worth the trouble.
>>
>> It would be even better to also patch Documentation/process/coding-style.rst,
>> in particular the printing section, making a mention to pr_fmt.
> 
> André, please address the comments in this email and from Willy. Note
> that the previous patch is queued up, so you'll need to make it relative
> to that.
> 

Ok Jens, I'll do it.
