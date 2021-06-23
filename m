Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383823B1586
	for <lists+linux-doc@lfdr.de>; Wed, 23 Jun 2021 10:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhFWIQn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Jun 2021 04:16:43 -0400
Received: from mail.netline.ch ([148.251.143.180]:51934 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbhFWIQm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jun 2021 04:16:42 -0400
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Jun 2021 04:16:40 EDT
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id A5F4F20201B;
        Wed, 23 Jun 2021 10:04:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 79HC0Bm0bZjt; Wed, 23 Jun 2021 10:04:54 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch [85.2.99.24])
        by netline-mail3.netline.ch (Postfix) with ESMTPA id 9EB0E20201A;
        Wed, 23 Jun 2021 10:04:53 +0200 (CEST)
Received: from localhost ([::1])
        by thor with esmtp (Exim 4.94.2)
        (envelope-from <michel@daenzer.net>)
        id 1lvxsN-000klp-H7; Wed, 23 Jun 2021 10:04:47 +0200
To:     Pekka Paalanen <ppaalanen@gmail.com>,
        Esaki Tomohito <etom@igel.co.jp>
Cc:     devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
        linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
 <20210622105757.2b9dec32@eldfell>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <01a20860-8fe2-2762-5678-d9a75f70e20a@daenzer.net>
Date:   Wed, 23 Jun 2021 10:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622105757.2b9dec32@eldfell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021-06-22 9:57 a.m., Pekka Paalanen wrote:
> On Tue, 22 Jun 2021 13:02:59 +0900
> Esaki Tomohito <etom@igel.co.jp> wrote:
> 
>> Hi, Thomas
>> Thank you for reply.
>>
>> On 2021/06/21 16:10, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 21.06.21 um 08:27 schrieb Tomohito Esaki:  
>>>> Virtual DRM splits the overlay planes of a display controller into
>>>> multiple
>>>> virtual devices to allow each plane to be accessed by each process.
>>>>
>>>> This makes it possible to overlay images output from multiple
>>>> processes on a
>>>> display. For example, one process displays the camera image without
>>>> compositor
>>>> while another process overlays the UI.  
>>>
>>> I briefly looked over your patches. I didn't understand how this is
>>> different to the functionality of a compositor? Shouldn't this be solved
>>> in userspace?  
>>
>> I think when latency is important (e.g., AR, VR, for displaying camera
>> images in IVI systems), there may be use cases where the compositor
>> cannot be used.
> 
> Hi,
> 
>> Normally, when the image is passed through the compositor, it is
>> displayed after 2 VSYNC at most, because the compositor combines the
>> image with VSYNC synchronization.
> 
> This is not a universal fact. You can write a Wayland compositor that
> consistently reaches app-to-screen latency of less than one monitor
> refresh cycle, while also using KMS planes.
> 
> I believe Weston succeeds in this already if you write the Wayland
> application accordingly.

For a specific example, https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620 allows app-to-screen latency as low as ~6 ms (including a fixed 2 ms buffer to avoid skipped frames). mutter doesn't use KMS planes yet, but if anything I'd expect that to help rather than hurt for latency (if the compositor doesn't need to draw anything).


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
