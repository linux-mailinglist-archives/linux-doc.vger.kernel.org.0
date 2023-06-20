Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528FD736C95
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jun 2023 15:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbjFTNAj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Jun 2023 09:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbjFTNAX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 09:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E8D173E
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687265970;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lQa8MfLdYEGWuHHZKxwhenP8/G9QSO9Y3/j/3OJliKQ=;
        b=DBMo1Ya9H5v0pGBuhGDEhOZ732hOBuc18nKO1vFxS9/pNHfbwv5bL/eMyxw7l/3wy6XEgN
        2XtQTc+pcRfWbCuaL1+MGGLfVEpbnImCV+utkPEjrvwgpf8/Mti8xn+tltZM9UfW7unCRS
        lMZu6f3MafvdewHKFSQ98rn1g6scOVs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-sxhiJTbjP_eAfEWOl3LOpA-1; Tue, 20 Jun 2023 08:59:27 -0400
X-MC-Unique: sxhiJTbjP_eAfEWOl3LOpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCC541C0E3C6;
        Tue, 20 Jun 2023 12:59:26 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.226.163])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 82344C1ED96;
        Tue, 20 Jun 2023 12:59:25 +0000 (UTC)
Date:   Tue, 20 Jun 2023 14:59:23 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Marco Morandini <marco.morandini@polimi.it>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/1] HID: Add introduction about HID for non-kernel
 programmers
Message-ID: <3mbw67akm2xzd2kgzb6sdfh4dly6im5jrz5umuvczjvrgxtf46@q5ooib3zkmfq>
References: <d6d16821-2592-8210-475a-5388d7a79e82@polimi.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6d16821-2592-8210-475a-5388d7a79e82@polimi.it>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi Marco,

On Jun 20 2023, Marco Morandini wrote:
> 
> This doc addition is meant to allow a random user 
> to understand what is going wrong with his 
> brand-new device, and possibly try to fix it on his own.
> I've written it, being one of those random users,
> in an effort to document what I think I've learned,
> and with the hope to minimize the pain to guys like me.

And many thanks for that. This is well written IMO and addresses a lot
of the pain points. So thanks!

> 
> The chapter is by no means complete, and for sure will require
> careful checking and fixing from the HID maintainers.
> In my opinion, it would also be great if they could add a brief
> explanation for the different quirks (I've left a FIXME there).

For that particular part (I'll reiterate in the review of the patch),
I'm not sure we are tackling the problem at the correct place. We should
document those in the code directly, and include/reference them in the
.rst file. Trying to duplicate this information is prone to
desynchronisation of the code and the doc and probably noone will keep
it up to date when there is a change.

> I hope I've not misunderstood too many concepts (?events?) and 
> that the whole thing is not so screwed up that it's better to
> throw it into the thrash can and run away without looking back.

There are a few nitpicks here and there, but you got the whole thing
(almost) right IMO :)

Cheers,
Benjamin

