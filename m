Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8EF66931C0
	for <lists+linux-doc@lfdr.de>; Sat, 11 Feb 2023 15:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBKOqk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 11 Feb 2023 09:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjBKOqi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 11 Feb 2023 09:46:38 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4FE30E8C
        for <linux-doc@vger.kernel.org>; Sat, 11 Feb 2023 06:46:15 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id c26so17527894ejz.10
        for <linux-doc@vger.kernel.org>; Sat, 11 Feb 2023 06:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4o6AxGiMa3db1kRKM3uKBNd9EiQAcdigPtll2/NLwKY=;
        b=LF7Fm9Y/jvx/tjyv5VDvc6uX5uk4Xgd745ie+iuUWRJHciRePA3p37iu93awbjFZoE
         cVLZwLH6nLcDbKBciRtnbR9fWWm3AtJ+RY9+Zh+H+CY55MzGIiN+8CKJtXdUDth7fyjv
         3T26PehoYb0nbVHt79p/d/mRaWpxCUgGrRSLKhT6iyFGcRlWk2LVNOZW0zGQEgI3CUWg
         G1iKbTZfSyhpwkskHeDZ8HT5B1J738b30YkPfLj5ODjT4iWtOY0AGzmGEKOZvWhuXscf
         UmhwHNx1uFXXcGV5M979pBlN3klku83Km3F4YM/VFz9VAEIeP45Tf7fAJl7AkoOvT7pw
         YtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4o6AxGiMa3db1kRKM3uKBNd9EiQAcdigPtll2/NLwKY=;
        b=1J2vPVV4prRytpB2reJZyUSXRJ4eLXgH1NJ/5vz2PAAUdHhqvx6YpywGH+GHKhE3DJ
         xn7YmmE1ZiJaxeFqp1jSX6Gj7PPZThVP7dHbs/8rCExm9C1Vf9lu4tN47Esr0fRQGx+k
         UTx8C2wvV5UrWZ1kHKMH2fUMdMwhN/5uS3UUt0sLnYk4MuzSS154tJ1PkfigelgZTQyM
         yI+PcjH2lxPl+BCOdY1i8uQfeH5oLQS5mI3dMPenuTg3iotT9gzvQvhWMe9ZChzTKnT5
         zDBY0YKb4kzkAmQyIjAEQiWPJjXWnWgGeESmeVLulmG4Jl4m/xs7RcOdoaUuWBKSKmHx
         SQeA==
X-Gm-Message-State: AO0yUKUBTt/pTNE8HoXxq0SDhgm1Lf3aHRt2Cc2jUF4Hteh++RLajP0H
        bEUfWhmg8SGQb5PInrw3YOjXPs7kG4A+iUZLgk4=
X-Google-Smtp-Source: AK7set9SrRNndIokbcsepkDd7Gnlyl5CfLKfWi0ogNUEi8lX18DaEHjZADxKg0Zi24A7VFQ5pRzUOmWzbVCpPevMGVw=
X-Received: by 2002:a17:906:4084:b0:888:432:243c with SMTP id
 u4-20020a170906408400b008880432243cmr2505159ejj.13.1676126751161; Sat, 11 Feb
 2023 06:45:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7412:4ca:b0:b3:9db0:5219 with HTTP; Sat, 11 Feb 2023
 06:45:50 -0800 (PST)
Reply-To: mrslorencegonzalez@gmail.com
From:   "Mrs.lorence Gonzalez" <brahimasandwidi@gmail.com>
Date:   Sat, 11 Feb 2023 06:45:50 -0800
Message-ID: <CALs2CarmqwSrSkrJQEQiiEXyD835c70=S-qrmouVAHsf_SMAsA@mail.gmail.com>
Subject: Mrs.lorence Gonzalez
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

GOD BLESS YOU AS YOU READ THIS MASSAGE

Am a dying woman here in the hospital, i was diagnose as a Cancer
patient over  2 Years ago.
I am A business woman how dealing with Gold Exportation. I Am from Us
California I have a
 charitable and unfulfilled project that am about to handover to you,
if you are interested
please reply.

Hope to hear from you.

Regard

mrslorencegonzalez@gmail.com
Mrs.lorence Gonzalez
