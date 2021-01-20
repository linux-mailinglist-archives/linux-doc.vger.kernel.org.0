Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9562FDA68
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 21:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389941AbhATOGW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Jan 2021 09:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390108AbhATNke (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 08:40:34 -0500
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BE4C0613D3
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:39:53 -0800 (PST)
Received: by mail-wm1-x349.google.com with SMTP id u67so1572575wmb.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=4HuaHnHsq3+9UDKnhuRegf7VhNzlZpKuJ1R6ivtSlOg=;
        b=RzwwBhI0LFDqKRi3rX8rfrpXZflyXVI8WUwGnh7kHJ3Rle/pz7qDeRwRyRnlJJPqD8
         AbDOl6ZRZHzI3FdOtQuR5PVuvAF4YuwgUucDI82DRg70lf7PQ85hM5g3qcrL/r9Ci9LP
         4E4wX5o5GFVFLBTVo18e+aywt/VYrsTcwYihokSuh1rpKBOiBOd6wYW8/eEJTHrIaTzG
         p/ObA5CGL2n/xo3pYACU0NdLVle/TTdGtxEeWFUsBoQjdYdz0hBfb67exaOcXtXOE504
         U5/MfbwJNVd2jtfthveCkpFwMRLuiDS0SN5W2OBNZTOseChuxpzulx0V/jtV8eeL+iM1
         809g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=4HuaHnHsq3+9UDKnhuRegf7VhNzlZpKuJ1R6ivtSlOg=;
        b=NJl7V+qgwMF1zBmSiXxdAdeH36nFlQpztaxzq1roYCNXitGmKWS2k4VFxDdXLamxtj
         Io4mEdzGzd1TaRmJ2Z++uFbLNlvcfx5ILa8N/lQgqMCjLt6orGiVKcPtdRx4IcMOluKL
         67MWRtyBxjFio6m+Hif/ZjKNgmv3lKReqfG5NdlaTelhxe749rgyutKJ0quUNvBn+ZUD
         nCYO1wcuoqGsqprQKlX9oxmq8flpZpQ4rQNcEWEJy6J+ywoP2dLyHfXdFqqsvO51uOZU
         KRmr4JmeOahVXqqFe4HTl8iCmUxV+Zx/x/clzHKADCEklL7++WAQqVbAMqqLq9v3tAqP
         RTNg==
X-Gm-Message-State: AOAM531T+A6CUe7QusQdJCS3HzPosFF1VsJm4wj1eO0DizjC2mWQe3x6
        uWLHK+N1ZvvjLTYL4mUUGhltZEnAkf+Xgg==
X-Google-Smtp-Source: ABdhPJz9D0nnseUovWpFIZ6H+T0/V01e1hCruHihQvhd66s20FOaGPv8ik7N7xcP/s+yNf1ljx+YYerX46ujqA==
Sender: "jackmanb via sendgmr" <jackmanb@beeg.c.googlers.com>
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a7b:cb54:: with SMTP id
 v20mr4532747wmj.148.1611149992267; Wed, 20 Jan 2021 05:39:52 -0800 (PST)
Date:   Wed, 20 Jan 2021 13:39:44 +0000
Message-Id: <20210120133946.2107897-1-jackmanb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH bpf-next v3 0/2] BPF docs fixups
From:   Brendan Jackman <jackmanb@google.com>
To:     bpf@vger.kernel.org
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Florent Revest <revest@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Difference from v2->v3 [1]:

 * Just fixed a commite message, rebased, and added Lukas' review tag - thanks
   Lukas!

Difference from v1->v2 [1]:

 * Split into 2 patches

 * Avoided unnecessary ': ::' in .rst source

 * Tweaked wording of the -mcpu=v3 bit a little more

[1] Previous versions:
    v1: https://lore.kernel.org/bpf/CA+i-1C1LVKjfQLBYk6siiqhxfy0jCR7UBcAmJ4jCED0A9aWsxA@mail.gmail.com/T/#t
    v2: https://lore.kernel.org/bpf/20210118155735.532663-1-jackmanb@google.com/T/#t

Brendan Jackman (2):
  docs: bpf: Fixup atomics markup
  docs: bpf: Clarify -mcpu=v3 requirement for atomic ops

 Documentation/networking/filter.rst | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)


base-commit: 8edc0c67d09d6bf441eeb39ae9316fe07478093f
--
2.30.0.284.gd98b1dd5eaa7-goog

