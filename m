Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C245E4D0A60
	for <lists+linux-doc@lfdr.de>; Mon,  7 Mar 2022 22:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236751AbiCGV63 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Mar 2022 16:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239228AbiCGV63 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 16:58:29 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0874B25FD
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 13:57:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id f8so21883771edf.10
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 13:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SdQCgFCfe/dYbHxCmZhEC3p9cTWfcQXWzJhxC16FNsM=;
        b=JD4nXwLEOkUWF6cctPMxvhVUfd8SQJGfWQHhhLNqtd52GKC9gYXxCiZ97fy2wURcpP
         2jpFWtZ5ngKSeYbARzGZprgMa1/NxSUXZs6yvABbXDlPam5VGAe9W2mIFbB4R+ekBXjR
         TSq/r16IU/O8f1DUSzm+VHNwHeWeVGJFBcu5APZAVPIg+fdgZADItEDaRpVw+JwOaEx2
         qS6CwMtAv/Pr5h5Z0mdLA5VlWbbFFncZJkPJVq7WuBmd5oQfKdzxAkknXQiJp/MV/L4a
         cRlB2u/y5MGFrscMlHInbKCPwlv9TcPlIqUPA2zOu6Vn9W1IL5hvEIx+13j4d72RdrmV
         xfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SdQCgFCfe/dYbHxCmZhEC3p9cTWfcQXWzJhxC16FNsM=;
        b=HBZjgyXqlXAtvyuRfwIDezttn56flxF1la/V8gHc820vOYNBYi31x6EzXbz3EqYgFa
         B692ivUU9bIKWRdk3y50jYtRMDCFwiB9EnrGfn0g03c5GCSJAOtFyBQjBESW7Qgmiv84
         678w+qCD7NYTeAL7rHZSmNE2TjIX5zYFirZVGkhCW10DKJtEQGkP5iMBQRXogpfxLVgU
         ORkDOgCFxwpVJ2uM9KuH3QrrzZkc2865gy7vvzKIrmZeoAT1Psyx9wryiT62N+kf1hH2
         8zMa72A+jtt27+En4ad7SSRjBathLkN5IVdQqiA2N/yBczkCB8SFX9tD90BtWRkWInmh
         JbXg==
X-Gm-Message-State: AOAM533JY5kasZnGHSe++OL5dAAus7hlji3lb4Rr5pz62wtKMmJCccSw
        XX082ktyrQwBYK2MD+0rn0GdN+b0Qpm4tAEF/Tbf62JhhGY=
X-Google-Smtp-Source: ABdhPJzrH0QJq0GwJ5iUkeWChq0B6QOM7YWL3hIEwKzQ8OTcq+N6SngsSnaUdqeGdm+KxUbRj/TX75ku7g9VYXDEfFU=
X-Received: by 2002:a05:6402:2318:b0:413:7645:fa51 with SMTP id
 l24-20020a056402231800b004137645fa51mr13253437eda.201.1646690252081; Mon, 07
 Mar 2022 13:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20220307174301.1852106-1-cawhitelaw@google.com>
 <87o82hd575.fsf@meer.lwn.net> <20220307134302.faaf3149ead4ccf0fb05a703@linux-foundation.org>
In-Reply-To: <20220307134302.faaf3149ead4ccf0fb05a703@linux-foundation.org>
From:   Clayton Whitelaw <cawhitelaw@google.com>
Date:   Mon, 7 Mar 2022 14:57:21 -0700
Message-ID: <CADascd-pQarNB6FRuG04Y61ACYxk3nWnw+z5dMV338xUapxvOA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/process: Replace broken link with snapshot
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, rostedt@goodmis.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 7, 2022 at 2:43 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 07 Mar 2022 10:48:30 -0700 Jonathan Corbet <corbet@lwn.net> wrote:
>
> > Clayton Whitelaw <cawhitelaw@google.com> writes:
> >
> > > The link is for the reference article, "The perfect patch":
> > > https://www.ozlabs.org/~akpm/stuff/tpp.txt
> > >
> > > This link is down currently and apparently since at least 2022 Jan:
> > > https://web.archive.org/web/20220112192643/https://www.ozlabs.org/~akpm/stuff/tpp.txt
> > >
> > > Replace with most recent good snapshot, from 2021 Oct
> >
> > We can do that, but first maybe we should ask Andrew (CC'd) whether he
> > has a copy up somewhere that we can link to?
> >
>
> Huh, whatever happened to that?
>
> I had a copy and have restored the file on ozlabs, thanks.

Confirmed I see it's up now.
