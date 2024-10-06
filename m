Return-Path: <linux-doc+bounces-26614-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CC2991E26
	for <lists+linux-doc@lfdr.de>; Sun,  6 Oct 2024 13:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1AA1281C95
	for <lists+linux-doc@lfdr.de>; Sun,  6 Oct 2024 11:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC58D15B12A;
	Sun,  6 Oct 2024 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBn3HlIQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98347167DAC;
	Sun,  6 Oct 2024 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728214547; cv=none; b=eX82LUKgys/wvnCJBIcHXrN2BajXxWz0Ow/H8MtGiF1N0A3/72aUBtN1gnYmRNMzOnMAeLTTO99KAi1dgtqZT6G5UsOy5m5rAeKPSsb+8VQE4yh5jxNpX9lIqT79UbsOZo495EFHrVAHi8wzvHx2W8JxkpKZh+AaSPx6B28XZmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728214547; c=relaxed/simple;
	bh=QaMclXmcoEyqZes1bmhF0LA5Epk1aP7l5+DWhYK7+jM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=smJgSixQHtaJ6qL9AUMmIQ68X1aZgxxxrQJhp3ZPeCIL4yyqYcIaFI6yTDEfZQtdWwNNaj9Z2gMVAMUnsT1jpfc64WTWRfCSs1VF9YMhvDMj9cPjbx1ORrEwSOAOzGTcKlbKiSL4zjn6PoDyH+EUMoxbWmFxYYulN6NBn7Es+uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBn3HlIQ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d24f98215so551265066b.1;
        Sun, 06 Oct 2024 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728214541; x=1728819341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1POeiBTqKLm0Kv56FL1mnklH+ZQAuoUbvaFFMJ/IJk=;
        b=OBn3HlIQDYhuPpNHujvexjdJ4aKyxGfNmV/UXDAn7DN5l3AlibOiF4Hub/1OCVFwEO
         mojmGtCxUqS2dEYD7HWE1THdOwhcmPt1muXUwKxWkxd792+KoEtPhYVFIpShvHGo++Oj
         1+VVQpV3egpNHWwJ0KsbOvvT/Mn7FVK5RTdIHpQCoos8yogxxmd7PKWv4CmXWx8qiRgz
         8x6e/GXJBw7fAQLzjixUeFedxzh+ytTT2VyxvtHzvI4BdxdvmZ/VgnP8N6xka/ukSCwx
         +UVuQcQx9s9ttd+pvESwMj6BBQbzcFGSmrxf2w1cwjCSCy7tvvRg2L834G33EOdC/M00
         YWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728214541; x=1728819341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1POeiBTqKLm0Kv56FL1mnklH+ZQAuoUbvaFFMJ/IJk=;
        b=QEFtiQ1jsEcZliD+uYRaTf2cJrNuGanroUIAKMBWUp68edHHReafwt2upd4d1fmjp2
         MaIC/8Zj4YIQc3BFV6acRKC9lxLg8CnnADfKiQ1LPQqJRXO+XRzyizzrCXfgxZunlWdo
         rVwdZCDKY6z2Z7X4zaVm4HQkZlt9ZyHBCYIp6snlYRYFQ6I2pCA9edK4E4QwpnYXiDx3
         Ads5jULkmBXHkZ7LxUG3EqrYGLV/1WqNDg/3iTiwDXbAP65WeINzdz7nRiP1bAJrzJch
         E+j9xhXBmU4jlCdWfLF4tYpCdVZgU+UmiFrBfvdZn+XHm9uAjcomRvVIpohIIXWDQY90
         v0+w==
X-Forwarded-Encrypted: i=1; AJvYcCUufBWWPM7gwN/nKwnHkHWh/gVeCuAbE1jJL0TVhTHp8x/1q1y+vi99xHezVp+e7h3tkA4M/I1lNRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrzBWJlxTRNXznMLPuIfC8/zyJHQXNwsEeAr/wX7I2czPb2XjH
	+6xWBhLrXHNM+guG7nWAYF3O+iLXiURh8stFOq5HRCVOw4HWkIqmva8YGA==
X-Google-Smtp-Source: AGHT+IFFeuNidhzsGorZ9Hxy2zea4mtArTYQ0ZrEdQ2vkfJoauIf40plE48Y84hToHtY8f+iumqwQg==
X-Received: by 2002:a17:907:3a95:b0:a99:33db:2035 with SMTP id a640c23a62f3a-a9933db210bmr352790966b.26.1728214541152;
        Sun, 06 Oct 2024 04:35:41 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:b8c4:9125:ad4d:4c8f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9936e62450sm213155866b.46.2024.10.06.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 04:35:40 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Cc: donald.hunter@redhat.com,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v3] doc: net: Fix .rst rendering of net_cachelines pages
Date: Sun,  6 Oct 2024 12:35:36 +0100
Message-ID: <20241006113536.96717-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The doc pages under /networking/net_cachelines are unreadable because
they lack .rst formatting for the tabular text.

Add simple table markup and tidy up the table contents:

- remove dashes that represent empty cells because they render
  as bullets and are not needed
- replace 'struct_*' with 'struct *' in the first column so that
  sphinx can render links for any structs that appear in the docs

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
Changes:
 - v3 fixes the table formatting
 - v2 is a rebase on net-next

 .../net_cachelines/inet_connection_sock.rst   |  86 ++---
 .../networking/net_cachelines/inet_sock.rst   |  74 ++--
 .../networking/net_cachelines/net_device.rst  | 354 +++++++++---------
 .../net_cachelines/netns_ipv4_sysctl.rst      | 300 +++++++--------
 .../networking/net_cachelines/snmp.rst        | 256 ++++++-------
 .../networking/net_cachelines/tcp_sock.rst    | 250 +++++++------
 6 files changed, 666 insertions(+), 654 deletions(-)

diff --git a/Documentation/networking/net_cachelines/inet_connection_sock.rst b/Documentation/networking/net_cachelines/inet_connection_sock.rst
index 7a911dc95652..4a15627fc93b 100644
--- a/Documentation/networking/net_cachelines/inet_connection_sock.rst
+++ b/Documentation/networking/net_cachelines/inet_connection_sock.rst
@@ -5,46 +5,48 @@
 inet_connection_sock struct fast path usage breakdown
 =====================================================
 
+=================================== ====================== =================== =================== ========================================================================================================================================================
 Type                                Name                   fastpath_tx_access  fastpath_rx_access  comment
-..struct                            ..inet_connection_sock                                         
-struct_inet_sock                    icsk_inet              read_mostly         read_mostly         tcp_init_buffer_space,tcp_init_transfer,tcp_finish_connect,tcp_connect,tcp_send_rcvq,tcp_send_syn_data
-struct_request_sock_queue           icsk_accept_queue      -                   -                   
-struct_inet_bind_bucket             icsk_bind_hash         read_mostly         -                   tcp_set_state
-struct_inet_bind2_bucket            icsk_bind2_hash        read_mostly         -                   tcp_set_state,inet_put_port
-unsigned_long                       icsk_timeout           read_mostly         -                   inet_csk_reset_xmit_timer,tcp_connect
-struct_timer_list                   icsk_retransmit_timer  read_mostly         -                   inet_csk_reset_xmit_timer,tcp_connect
-struct_timer_list                   icsk_delack_timer      read_mostly         -                   inet_csk_reset_xmit_timer,tcp_connect
-u32                                 icsk_rto               read_write          -                   tcp_cwnd_validate,tcp_schedule_loss_probe,tcp_connect_init,tcp_connect,tcp_write_xmit,tcp_push_one
-u32                                 icsk_rto_min           -                   -                   
-u32                                 icsk_delack_max        -                   -                   
-u32                                 icsk_pmtu_cookie       read_write          -                   tcp_sync_mss,tcp_current_mss,tcp_send_syn_data,tcp_connect_init,tcp_connect
-struct_tcp_congestion_ops           icsk_ca_ops            read_write          -                   tcp_cwnd_validate,tcp_tso_segs,tcp_ca_dst_init,tcp_connect_init,tcp_connect,tcp_write_xmit
-struct_inet_connection_sock_af_ops  icsk_af_ops            read_mostly         -                   tcp_finish_connect,tcp_send_syn_data,tcp_mtup_init,tcp_mtu_check_reprobe,tcp_mtu_probe,tcp_connect_init,tcp_connect,__tcp_transmit_skb
-struct_tcp_ulp_ops*                 icsk_ulp_ops           -                   -                   
-void*                               icsk_ulp_data          -                   -                   
-u8:5                                icsk_ca_state          read_write          -                   tcp_cwnd_application_limited,tcp_set_ca_state,tcp_enter_cwr,tcp_tso_should_defer,tcp_mtu_probe,tcp_schedule_loss_probe,tcp_write_xmit,__tcp_transmit_skb
-u8:1                                icsk_ca_initialized    read_write          -                   tcp_init_transfer,tcp_init_congestion_control,tcp_init_transfer,tcp_finish_connect,tcp_connect
-u8:1                                icsk_ca_setsockopt     -                   -                   
-u8:1                                icsk_ca_dst_locked     write_mostly        -                   tcp_ca_dst_init,tcp_connect_init,tcp_connect
-u8                                  icsk_retransmits       write_mostly        -                   tcp_connect_init,tcp_connect
-u8                                  icsk_pending           read_write          -                   inet_csk_reset_xmit_timer,tcp_connect,tcp_check_probe_timer,__tcp_push_pending_frames,tcp_rearm_rto,tcp_event_new_data_sent,tcp_event_new_data_sent
-u8                                  icsk_backoff           write_mostly        -                   tcp_write_queue_purge,tcp_connect_init
-u8                                  icsk_syn_retries       -                   -                   
-u8                                  icsk_probes_out        -                   -                   
-u16                                 icsk_ext_hdr_len       read_mostly         -                   __tcp_mtu_to_mss,tcp_mtu_to_rss,tcp_mtu_probe,tcp_write_xmit,tcp_mtu_to_mss,
-struct_icsk_ack_u8                  pending                read_write          read_write          inet_csk_ack_scheduled,__tcp_cleanup_rbuf,tcp_cleanup_rbuf,inet_csk_clear_xmit_timer,tcp_event_ack-sent,inet_csk_reset_xmit_timer
-struct_icsk_ack_u8                  quick                  read_write          write_mostly        tcp_dec_quickack_mode,tcp_event_ack_sent,__tcp_transmit_skb,__tcp_select_window,__tcp_cleanup_rbuf
-struct_icsk_ack_u8                  pingpong               -                   -                   
-struct_icsk_ack_u8                  retry                  write_mostly        read_write          inet_csk_clear_xmit_timer,tcp_rearm_rto,tcp_event_new_data_sent,tcp_write_xmit,__tcp_send_ack,tcp_send_ack,
-struct_icsk_ack_u8                  ato                    read_mostly         write_mostly        tcp_dec_quickack_mode,tcp_event_ack_sent,__tcp_transmit_skb,__tcp_send_ack,tcp_send_ack
-struct_icsk_ack_unsigned_long       timeout                read_write          read_write          inet_csk_reset_xmit_timer,tcp_connect
-struct_icsk_ack_u32                 lrcvtime               read_write          -                   tcp_finish_connect,tcp_connect,tcp_event_data_sent,__tcp_transmit_skb
-struct_icsk_ack_u16                 rcv_mss                write_mostly        read_mostly         __tcp_select_window,__tcp_cleanup_rbuf,tcp_initialize_rcv_mss,tcp_connect_init
-struct_icsk_mtup_int                search_high            read_write          -                   tcp_mtup_init,tcp_sync_mss,tcp_connect_init,tcp_mtu_check_reprobe,tcp_write_xmit
-struct_icsk_mtup_int                search_low             read_write          -                   tcp_mtu_probe,tcp_mtu_check_reprobe,tcp_write_xmit,tcp_sync_mss,tcp_connect_init,tcp_mtup_init
-struct_icsk_mtup_u32:31             probe_size             read_write          -                   tcp_mtup_init,tcp_connect_init,__tcp_transmit_skb
-struct_icsk_mtup_u32:1              enabled                read_write          -                   tcp_mtup_init,tcp_sync_mss,tcp_connect_init,tcp_mtu_probe,tcp_write_xmit
-struct_icsk_mtup_u32                probe_timestamp        read_write          -                   tcp_mtup_init,tcp_connect_init,tcp_mtu_check_reprobe,tcp_mtu_probe
-u32                                 icsk_probes_tstamp     -                   -                   
-u32                                 icsk_user_timeout      -                   -                   
-u64[104/sizeof(u64)]                icsk_ca_priv           -                   -                   
+=================================== ====================== =================== =================== ========================================================================================================================================================
+struct inet_sock                    icsk_inet              read_mostly         read_mostly         tcp_init_buffer_space,tcp_init_transfer,tcp_finish_connect,tcp_connect,tcp_send_rcvq,tcp_send_syn_data
+struct request_sock_queue           icsk_accept_queue
+struct inet_bind_bucket             icsk_bind_hash         read_mostly                             tcp_set_state
+struct inet_bind2_bucket            icsk_bind2_hash        read_mostly                             tcp_set_state,inet_put_port
+unsigned_long                       icsk_timeout           read_mostly                             inet_csk_reset_xmit_timer,tcp_connect
+struct timer_list                   icsk_retransmit_timer  read_mostly                             inet_csk_reset_xmit_timer,tcp_connect
+struct timer_list                   icsk_delack_timer      read_mostly                             inet_csk_reset_xmit_timer,tcp_connect
+u32                                 icsk_rto               read_write                              tcp_cwnd_validate,tcp_schedule_loss_probe,tcp_connect_init,tcp_connect,tcp_write_xmit,tcp_push_one
+u32                                 icsk_rto_min
+u32                                 icsk_delack_max
+u32                                 icsk_pmtu_cookie       read_write                              tcp_sync_mss,tcp_current_mss,tcp_send_syn_data,tcp_connect_init,tcp_connect
+struct tcp_congestion_ops           icsk_ca_ops            read_write                              tcp_cwnd_validate,tcp_tso_segs,tcp_ca_dst_init,tcp_connect_init,tcp_connect,tcp_write_xmit
+struct inet_connection_sock_af_ops  icsk_af_ops            read_mostly                             tcp_finish_connect,tcp_send_syn_data,tcp_mtup_init,tcp_mtu_check_reprobe,tcp_mtu_probe,tcp_connect_init,tcp_connect,__tcp_transmit_skb
+struct tcp_ulp_ops*                 icsk_ulp_ops
+void*                               icsk_ulp_data
+u8:5                                icsk_ca_state          read_write                              tcp_cwnd_application_limited,tcp_set_ca_state,tcp_enter_cwr,tcp_tso_should_defer,tcp_mtu_probe,tcp_schedule_loss_probe,tcp_write_xmit,__tcp_transmit_skb
+u8:1                                icsk_ca_initialized    read_write                              tcp_init_transfer,tcp_init_congestion_control,tcp_init_transfer,tcp_finish_connect,tcp_connect
+u8:1                                icsk_ca_setsockopt
+u8:1                                icsk_ca_dst_locked     write_mostly                            tcp_ca_dst_init,tcp_connect_init,tcp_connect
+u8                                  icsk_retransmits       write_mostly                            tcp_connect_init,tcp_connect
+u8                                  icsk_pending           read_write                              inet_csk_reset_xmit_timer,tcp_connect,tcp_check_probe_timer,__tcp_push_pending_frames,tcp_rearm_rto,tcp_event_new_data_sent,tcp_event_new_data_sent
+u8                                  icsk_backoff           write_mostly                            tcp_write_queue_purge,tcp_connect_init
+u8                                  icsk_syn_retries
+u8                                  icsk_probes_out
+u16                                 icsk_ext_hdr_len       read_mostly                             __tcp_mtu_to_mss,tcp_mtu_to_rss,tcp_mtu_probe,tcp_write_xmit,tcp_mtu_to_mss,
+struct icsk_ack_u8                  pending                read_write          read_write          inet_csk_ack_scheduled,__tcp_cleanup_rbuf,tcp_cleanup_rbuf,inet_csk_clear_xmit_timer,tcp_event_ack-sent,inet_csk_reset_xmit_timer
+struct icsk_ack_u8                  quick                  read_write          write_mostly        tcp_dec_quickack_mode,tcp_event_ack_sent,__tcp_transmit_skb,__tcp_select_window,__tcp_cleanup_rbuf
+struct icsk_ack_u8                  pingpong
+struct icsk_ack_u8                  retry                  write_mostly        read_write          inet_csk_clear_xmit_timer,tcp_rearm_rto,tcp_event_new_data_sent,tcp_write_xmit,__tcp_send_ack,tcp_send_ack,
+struct icsk_ack_u8                  ato                    read_mostly         write_mostly        tcp_dec_quickack_mode,tcp_event_ack_sent,__tcp_transmit_skb,__tcp_send_ack,tcp_send_ack
+struct icsk_ack_unsigned_long       timeout                read_write          read_write          inet_csk_reset_xmit_timer,tcp_connect
+struct icsk_ack_u32                 lrcvtime               read_write                              tcp_finish_connect,tcp_connect,tcp_event_data_sent,__tcp_transmit_skb
+struct icsk_ack_u16                 rcv_mss                write_mostly        read_mostly         __tcp_select_window,__tcp_cleanup_rbuf,tcp_initialize_rcv_mss,tcp_connect_init
+struct icsk_mtup_int                search_high            read_write                              tcp_mtup_init,tcp_sync_mss,tcp_connect_init,tcp_mtu_check_reprobe,tcp_write_xmit
+struct icsk_mtup_int                search_low             read_write                              tcp_mtu_probe,tcp_mtu_check_reprobe,tcp_write_xmit,tcp_sync_mss,tcp_connect_init,tcp_mtup_init
+struct icsk_mtup_u32:31             probe_size             read_write                              tcp_mtup_init,tcp_connect_init,__tcp_transmit_skb
+struct icsk_mtup_u32:1              enabled                read_write                              tcp_mtup_init,tcp_sync_mss,tcp_connect_init,tcp_mtu_probe,tcp_write_xmit
+struct icsk_mtup_u32                probe_timestamp        read_write                              tcp_mtup_init,tcp_connect_init,tcp_mtu_check_reprobe,tcp_mtu_probe
+u32                                 icsk_probes_tstamp
+u32                                 icsk_user_timeout
+u64[104/sizeof(u64)]                icsk_ca_priv
+=================================== ====================== =================== =================== ========================================================================================================================================================
diff --git a/Documentation/networking/net_cachelines/inet_sock.rst b/Documentation/networking/net_cachelines/inet_sock.rst
index 595d7ef5fc8b..b11bf48fa2b3 100644
--- a/Documentation/networking/net_cachelines/inet_sock.rst
+++ b/Documentation/networking/net_cachelines/inet_sock.rst
@@ -5,40 +5,42 @@
 inet_sock struct fast path usage breakdown
 ==========================================
 
+======================= ===================== =================== =================== ======================================================================================================
 Type                    Name                  fastpath_tx_access  fastpath_rx_access  comment
-..struct                ..inet_sock                                                     
-struct_sock             sk                    read_mostly         read_mostly         tcp_init_buffer_space,tcp_init_transfer,tcp_finish_connect,tcp_connect,tcp_send_rcvq,tcp_send_syn_data
-struct_ipv6_pinfo*      pinet6                -                   -                   
-be16                    inet_sport            read_mostly         -                   __tcp_transmit_skb
-be32                    inet_daddr            read_mostly         -                   ip_select_ident_segs
-be32                    inet_rcv_saddr        -                   -                   
-be16                    inet_dport            read_mostly         -                   __tcp_transmit_skb
-u16                     inet_num              -                   -                   
-be32                    inet_saddr            -                   -                   
-s16                     uc_ttl                read_mostly         -                   __ip_queue_xmit/ip_select_ttl
-u16                     cmsg_flags            -                   -                   
-struct_ip_options_rcu*  inet_opt              read_mostly         -                   __ip_queue_xmit
-u16                     inet_id               read_mostly         -                   ip_select_ident_segs
-u8                      tos                   read_mostly         -                   ip_queue_xmit
-u8                      min_ttl               -                   -                   
-u8                      mc_ttl                -                   -                   
-u8                      pmtudisc              -                   -                   
-u8:1                    recverr               -                   -                   
-u8:1                    is_icsk               -                   -                   
-u8:1                    freebind              -                   -                   
-u8:1                    hdrincl               -                   -                   
-u8:1                    mc_loop               -                   -                   
-u8:1                    transparent           -                   -                   
-u8:1                    mc_all                -                   -                   
-u8:1                    nodefrag              -                   -                   
-u8:1                    bind_address_no_port  -                   -                   
-u8:1                    recverr_rfc4884       -                   -                   
-u8:1                    defer_connect         read_mostly         -                   tcp_sendmsg_fastopen
-u8                      rcv_tos               -                   -                   
-u8                      convert_csum          -                   -                   
-int                     uc_index              -                   -                   
-int                     mc_index              -                   -                   
-be32                    mc_addr               -                   -                   
-struct_ip_mc_socklist*  mc_list               -                   -                   
-struct_inet_cork_full   cork                  read_mostly         -                   __tcp_transmit_skb
-struct                  local_port_range      -                   -                   
+======================= ===================== =================== =================== ======================================================================================================
+struct sock             sk                    read_mostly         read_mostly         tcp_init_buffer_space,tcp_init_transfer,tcp_finish_connect,tcp_connect,tcp_send_rcvq,tcp_send_syn_data
+struct ipv6_pinfo*      pinet6
+be16                    inet_sport            read_mostly                             __tcp_transmit_skb
+be32                    inet_daddr            read_mostly                             ip_select_ident_segs
+be32                    inet_rcv_saddr
+be16                    inet_dport            read_mostly                             __tcp_transmit_skb
+u16                     inet_num
+be32                    inet_saddr
+s16                     uc_ttl                read_mostly                             __ip_queue_xmit/ip_select_ttl
+u16                     cmsg_flags
+struct ip_options_rcu*  inet_opt              read_mostly                             __ip_queue_xmit
+u16                     inet_id               read_mostly                             ip_select_ident_segs
+u8                      tos                   read_mostly                             ip_queue_xmit
+u8                      min_ttl
+u8                      mc_ttl
+u8                      pmtudisc
+u8:1                    recverr
+u8:1                    is_icsk
+u8:1                    freebind
+u8:1                    hdrincl
+u8:1                    mc_loop
+u8:1                    transparent
+u8:1                    mc_all
+u8:1                    nodefrag
+u8:1                    bind_address_no_port
+u8:1                    recverr_rfc4884
+u8:1                    defer_connect         read_mostly                             tcp_sendmsg_fastopen
+u8                      rcv_tos
+u8                      convert_csum
+int                     uc_index
+int                     mc_index
+be32                    mc_addr
+struct ip_mc_socklist*  mc_list
+struct inet_cork_full   cork                  read_mostly                             __tcp_transmit_skb
+struct                  local_port_range
+======================= ===================== =================== =================== ======================================================================================================
diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 49f03cb78c6e..e421ae0ab62d 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -5,182 +5,184 @@
 net_device struct fast path usage breakdown
 ===========================================
 
-Type                                Name                    fastpath_tx_access  fastpath_rx_access  Comments
-..struct                            ..net_device                                                    
-unsigned_long:32                    priv_flags              read_mostly         -                   __dev_queue_xmit(tx)
-unsigned_long:1                     lltx                    read_mostly         -                   HARD_TX_LOCK,HARD_TX_TRYLOCK,HARD_TX_UNLOCK(tx)
-char                                name[16]                -                   -                   
-struct_netdev_name_node*            name_node                                                       
-struct_dev_ifalias*                 ifalias                                                         
-unsigned_long                       mem_end                                                         
-unsigned_long                       mem_start                                                       
-unsigned_long                       base_addr                                                       
-unsigned_long                       state                   read_mostly         read_mostly         netif_running(dev)
-struct_list_head                    dev_list                                                        
-struct_list_head                    napi_list                                                       
-struct_list_head                    unreg_list                                                      
-struct_list_head                    close_list                                                      
-struct_list_head                    ptype_all               read_mostly         -                   dev_nit_active(tx)
-struct_list_head                    ptype_specific                              read_mostly         deliver_ptype_list_skb/__netif_receive_skb_core(rx)
-struct                              adj_list                                                        
-unsigned_int                        flags                   read_mostly         read_mostly         __dev_queue_xmit,__dev_xmit_skb,ip6_output,__ip6_finish_output(tx);ip6_rcv_core(rx)
-xdp_features_t                      xdp_features                                                    
-struct_net_device_ops*              netdev_ops              read_mostly         -                   netdev_core_pick_tx,netdev_start_xmit(tx)
-struct_xdp_metadata_ops*            xdp_metadata_ops                                                
-int                                 ifindex                 -                   read_mostly         ip6_rcv_core
-unsigned_short                      gflags                                                          
-unsigned_short                      hard_header_len         read_mostly         read_mostly         ip6_xmit(tx);gro_list_prepare(rx)
-unsigned_int                        mtu                     read_mostly         -                   ip_finish_output2
-unsigned_short                      needed_headroom         read_mostly         -                   LL_RESERVED_SPACE/ip_finish_output2
-unsigned_short                      needed_tailroom                                                 
-netdev_features_t                   features                read_mostly         read_mostly         HARD_TX_LOCK,netif_skb_features,sk_setup_caps(tx);netif_elide_gro(rx)
-netdev_features_t                   hw_features                                                     
-netdev_features_t                   wanted_features                                                 
-netdev_features_t                   vlan_features                                                   
-netdev_features_t                   hw_enc_features         -                   -                   netif_skb_features
-netdev_features_t                   mpls_features                                                   
-netdev_features_t                   gso_partial_features    read_mostly                             gso_features_check
-unsigned_int                        min_mtu                                                         
-unsigned_int                        max_mtu                                                         
-unsigned_short                      type                                                            
-unsigned_char                       min_header_len                                                  
-unsigned_char                       name_assign_type                                                
-int                                 group                                                           
-struct_net_device_stats             stats                                                           
-struct_net_device_core_stats*       core_stats                                                      
-atomic_t                            carrier_up_count                                                
-atomic_t                            carrier_down_count                                              
-struct_iw_handler_def*              wireless_handlers                                               
-struct_iw_public_data*              wireless_data                                                   
-struct_ethtool_ops*                 ethtool_ops                                                     
-struct_l3mdev_ops*                  l3mdev_ops                                                      
-struct_ndisc_ops*                   ndisc_ops                                                       
-struct_xfrmdev_ops*                 xfrmdev_ops                                                     
-struct_tlsdev_ops*                  tlsdev_ops                                                      
-struct_header_ops*                  header_ops              read_mostly         -                   ip_finish_output2,ip6_finish_output2(tx)
-unsigned_char                       operstate                                                       
-unsigned_char                       link_mode                                                       
-unsigned_char                       if_port                                                         
-unsigned_char                       dma                                                             
-unsigned_char                       perm_addr[32]                                                   
-unsigned_char                       addr_assign_type                                                
-unsigned_char                       addr_len                                                        
-unsigned_char                       upper_level                                                     
-unsigned_char                       lower_level                                                     
-unsigned_short                      neigh_priv_len                                                  
-unsigned_short                      padded                                                          
-unsigned_short                      dev_id                                                          
-unsigned_short                      dev_port                                                        
-spinlock_t                          addr_list_lock                                                  
-int                                 irq                                                             
-struct_netdev_hw_addr_list          uc                                                              
-struct_netdev_hw_addr_list          mc                                                              
-struct_netdev_hw_addr_list          dev_addrs                                                       
-struct_kset*                        queues_kset                                                     
-struct_list_head                    unlink_list                                                     
-unsigned_int                        promiscuity                                                     
-unsigned_int                        allmulti                                                        
-bool                                uc_promisc                                                      
-unsigned_char                       nested_level                                                    
-struct_in_device*                   ip_ptr                  read_mostly         read_mostly         __in_dev_get
-struct_inet6_dev*                   ip6_ptr                 read_mostly         read_mostly         __in6_dev_get
-struct_vlan_info*                   vlan_info                                                       
-struct_dsa_port*                    dsa_ptr                                                         
-struct_tipc_bearer*                 tipc_ptr                                                        
-void*                               atalk_ptr                                                       
-void*                               ax25_ptr                                                        
-struct_wireless_dev*                ieee80211_ptr                                                   
-struct_wpan_dev*                    ieee802154_ptr                                                  
-struct_mpls_dev*                    mpls_ptr                                                        
-struct_mctp_dev*                    mctp_ptr                                                        
-unsigned_char*                      dev_addr                                                        
-struct_netdev_queue*                _rx                     read_mostly         -                   netdev_get_rx_queue(rx)
-unsigned_int                        num_rx_queues                                                   
-unsigned_int                        real_num_rx_queues      -                   read_mostly         get_rps_cpu
-struct_bpf_prog*                    xdp_prog                -                   read_mostly         netif_elide_gro()
-unsigned_long                       gro_flush_timeout       -                   read_mostly         napi_complete_done
-u32                                 napi_defer_hard_irqs    -                   read_mostly         napi_complete_done
-unsigned_int                        gro_max_size            -                   read_mostly         skb_gro_receive
-unsigned_int                        gro_ipv4_max_size       -                   read_mostly         skb_gro_receive
-rx_handler_func_t*                  rx_handler              read_mostly         -                   __netif_receive_skb_core
-void*                               rx_handler_data         read_mostly         -                   
-struct_netdev_queue*                ingress_queue           read_mostly         -                   
-struct_bpf_mprog_entry              tcx_ingress             -                   read_mostly         sch_handle_ingress
-struct_nf_hook_entries*             nf_hooks_ingress                                                
-unsigned_char                       broadcast[32]                                                   
-struct_cpu_rmap*                    rx_cpu_rmap                                                     
-struct_hlist_node                   index_hlist                                                     
-struct_netdev_queue*                _tx                     read_mostly         -                   netdev_get_tx_queue(tx)
-unsigned_int                        num_tx_queues           -                   -                   
-unsigned_int                        real_num_tx_queues      read_mostly         -                   skb_tx_hash,netdev_core_pick_tx(tx)
-unsigned_int                        tx_queue_len                                                    
-spinlock_t                          tx_global_lock                                                  
-struct_xdp_dev_bulk_queue__percpu*  xdp_bulkq                                                       
-struct_xps_dev_maps*                xps_maps[2]             read_mostly         -                   __netif_set_xps_queue
-struct_bpf_mprog_entry              tcx_egress              read_mostly         -                   sch_handle_egress
-struct_nf_hook_entries*             nf_hooks_egress         read_mostly         -                   
-struct_hlist_head                   qdisc_hash[16]                                                  
-struct_timer_list                   watchdog_timer                                                  
-int                                 watchdog_timeo                                                  
-u32                                 proto_down_reason                                               
-struct_list_head                    todo_list                                                       
-int__percpu*                        pcpu_refcnt                                                     
-refcount_t                          dev_refcnt                                                      
-struct_ref_tracker_dir              refcnt_tracker                                                  
-struct_list_head                    link_watch_list                                                 
-enum:8                              reg_state                                                       
-bool                                dismantle                                                       
-enum:16                             rtnl_link_state                                                 
-bool                                needs_free_netdev                                               
-void*priv_destructor                struct_net_device                                               
-struct_netpoll_info*                npinfo                  -                   read_mostly         napi_poll/napi_poll_lock
-possible_net_t                      nd_net                  -                   read_mostly         (dev_net)napi_busy_loop,tcp_v(4/6)_rcv,ip(v6)_rcv,ip(6)_input,ip(6)_input_finish
-void*                               ml_priv                                                         
-enum_netdev_ml_priv_type            ml_priv_type                                                    
-struct_pcpu_lstats__percpu*         lstats                  read_mostly                             dev_lstats_add()
-struct_pcpu_sw_netstats__percpu*    tstats                  read_mostly                             dev_sw_netstats_tx_add()
-struct_pcpu_dstats__percpu*         dstats                                                          
-struct_garp_port*                   garp_port                                                       
-struct_mrp_port*                    mrp_port                                                        
-struct_dm_hw_stat_delta*            dm_private                                                      
-struct_device                       dev                     -                   -                   
-struct_attribute_group*             sysfs_groups[4]                                                 
-struct_attribute_group*             sysfs_rx_queue_group                                            
-struct_rtnl_link_ops*               rtnl_link_ops                                                   
-unsigned_int                        gso_max_size            read_mostly         -                   sk_dst_gso_max_size
-unsigned_int                        tso_max_size                                                    
-u16                                 gso_max_segs            read_mostly         -                   gso_max_segs
-u16                                 tso_max_segs                                                    
-unsigned_int                        gso_ipv4_max_size       read_mostly         -                   sk_dst_gso_max_size
-struct_dcbnl_rtnl_ops*              dcbnl_ops                                                       
-s16                                 num_tc                  read_mostly         -                   skb_tx_hash
-struct_netdev_tc_txq                tc_to_txq[16]           read_mostly         -                   skb_tx_hash
-u8                                  prio_tc_map[16]                                                 
-unsigned_int                        fcoe_ddp_xid                                                    
-struct_netprio_map*                 priomap                                                         
-struct_phy_device*                  phydev                                                          
-struct_sfp_bus*                     sfp_bus                                                         
-struct_lock_class_key*              qdisc_tx_busylock                                               
-bool                                proto_down                                                      
-unsigned:1                          wol_enabled                                                     
-unsigned:1                          threaded                -                   -                   napi_poll(napi_enable,dev_set_threaded)
-unsigned_long:1                     see_all_hwtstamp_requests                                       
-unsigned_long:1                     change_proto_down                                               
-unsigned_long:1                     netns_local                                                     
-unsigned_long:1                     fcoe_mtu                                                        
-struct_list_head                    net_notifier_list                                               
-struct_macsec_ops*                  macsec_ops                                                      
-struct_udp_tunnel_nic_info*         udp_tunnel_nic_info                                             
-struct_udp_tunnel_nic*              udp_tunnel_nic                                                  
-unsigned_int                        xdp_zc_max_segs                                                 
-struct_bpf_xdp_entity               xdp_state[3]                                                    
-u8                                  dev_addr_shadow[32]                                             
-netdevice_tracker                   linkwatch_dev_tracker                                           
-netdevice_tracker                   watchdog_dev_tracker                                            
-netdevice_tracker                   dev_registered_tracker                                          
-struct_rtnl_hw_stats64*             offload_xstats_l3                                               
-struct_devlink_port*                devlink_port                                                    
-struct_dpll_pin*                    dpll_pin                                                        
+=================================== =========================== =================== =================== ===================================================================================
+Type                                Name                        fastpath_tx_access  fastpath_rx_access  Comments
+=================================== =========================== =================== =================== ===================================================================================
+unsigned_long:32                    priv_flags                  read_mostly                             __dev_queue_xmit(tx)
+unsigned_long:1                     lltx                        read_mostly                             HARD_TX_LOCK,HARD_TX_TRYLOCK,HARD_TX_UNLOCK(tx)
+char                                name[16]
+struct netdev_name_node*            name_node
+struct dev_ifalias*                 ifalias
+unsigned_long                       mem_end
+unsigned_long                       mem_start
+unsigned_long                       base_addr
+unsigned_long                       state                       read_mostly         read_mostly         netif_running(dev)
+struct list_head                    dev_list
+struct list_head                    napi_list
+struct list_head                    unreg_list
+struct list_head                    close_list
+struct list_head                    ptype_all                   read_mostly                             dev_nit_active(tx)
+struct list_head                    ptype_specific                                  read_mostly         deliver_ptype_list_skb/__netif_receive_skb_core(rx)
+struct                              adj_list
+unsigned_int                        flags                       read_mostly         read_mostly         __dev_queue_xmit,__dev_xmit_skb,ip6_output,__ip6_finish_output(tx);ip6_rcv_core(rx)
+xdp_features_t                      xdp_features
+struct net_device_ops*              netdev_ops                  read_mostly                             netdev_core_pick_tx,netdev_start_xmit(tx)
+struct xdp_metadata_ops*            xdp_metadata_ops
+int                                 ifindex                                         read_mostly         ip6_rcv_core
+unsigned_short                      gflags
+unsigned_short                      hard_header_len             read_mostly         read_mostly         ip6_xmit(tx);gro_list_prepare(rx)
+unsigned_int                        mtu                         read_mostly                             ip_finish_output2
+unsigned_short                      needed_headroom             read_mostly                             LL_RESERVED_SPACE/ip_finish_output2
+unsigned_short                      needed_tailroom
+netdev_features_t                   features                    read_mostly         read_mostly         HARD_TX_LOCK,netif_skb_features,sk_setup_caps(tx);netif_elide_gro(rx)
+netdev_features_t                   hw_features
+netdev_features_t                   wanted_features
+netdev_features_t                   vlan_features
+netdev_features_t                   hw_enc_features                                                     netif_skb_features
+netdev_features_t                   mpls_features
+netdev_features_t                   gso_partial_features        read_mostly                             gso_features_check
+unsigned_int                        min_mtu
+unsigned_int                        max_mtu
+unsigned_short                      type
+unsigned_char                       min_header_len
+unsigned_char                       name_assign_type
+int                                 group
+struct net_device_stats             stats
+struct net_device_core_stats*       core_stats
+atomic_t                            carrier_up_count
+atomic_t                            carrier_down_count
+struct iw_handler_def*              wireless_handlers
+struct iw_public_data*              wireless_data
+struct ethtool_ops*                 ethtool_ops
+struct l3mdev_ops*                  l3mdev_ops
+struct ndisc_ops*                   ndisc_ops
+struct xfrmdev_ops*                 xfrmdev_ops
+struct tlsdev_ops*                  tlsdev_ops
+struct header_ops*                  header_ops                  read_mostly                             ip_finish_output2,ip6_finish_output2(tx)
+unsigned_char                       operstate
+unsigned_char                       link_mode
+unsigned_char                       if_port
+unsigned_char                       dma
+unsigned_char                       perm_addr[32]
+unsigned_char                       addr_assign_type
+unsigned_char                       addr_len
+unsigned_char                       upper_level
+unsigned_char                       lower_level
+unsigned_short                      neigh_priv_len
+unsigned_short                      padded
+unsigned_short                      dev_id
+unsigned_short                      dev_port
+spinlock_t                          addr_list_lock
+int                                 irq
+struct netdev_hw_addr_list          uc
+struct netdev_hw_addr_list          mc
+struct netdev_hw_addr_list          dev_addrs
+struct kset*                        queues_kset
+struct list_head                    unlink_list
+unsigned_int                        promiscuity
+unsigned_int                        allmulti
+bool                                uc_promisc
+unsigned_char                       nested_level
+struct in_device*                   ip_ptr                      read_mostly         read_mostly         __in_dev_get
+struct inet6_dev*                   ip6_ptr                     read_mostly         read_mostly         __in6_dev_get
+struct vlan_info*                   vlan_info
+struct dsa_port*                    dsa_ptr
+struct tipc_bearer*                 tipc_ptr
+void*                               atalk_ptr
+void*                               ax25_ptr
+struct wireless_dev*                ieee80211_ptr
+struct wpan_dev*                    ieee802154_ptr
+struct mpls_dev*                    mpls_ptr
+struct mctp_dev*                    mctp_ptr
+unsigned_char*                      dev_addr
+struct netdev_queue*                _rx                         read_mostly                             netdev_get_rx_queue(rx)
+unsigned_int                        num_rx_queues
+unsigned_int                        real_num_rx_queues                              read_mostly         get_rps_cpu
+struct bpf_prog*                    xdp_prog                                        read_mostly         netif_elide_gro()
+unsigned_long                       gro_flush_timeout                               read_mostly         napi_complete_done
+u32                                 napi_defer_hard_irqs                            read_mostly         napi_complete_done
+unsigned_int                        gro_max_size                                    read_mostly         skb_gro_receive
+unsigned_int                        gro_ipv4_max_size                               read_mostly         skb_gro_receive
+rx_handler_func_t*                  rx_handler                  read_mostly                             __netif_receive_skb_core
+void*                               rx_handler_data             read_mostly
+struct netdev_queue*                ingress_queue               read_mostly
+struct bpf_mprog_entry              tcx_ingress                                     read_mostly         sch_handle_ingress
+struct nf_hook_entries*             nf_hooks_ingress
+unsigned_char                       broadcast[32]
+struct cpu_rmap*                    rx_cpu_rmap
+struct hlist_node                   index_hlist
+struct netdev_queue*                _tx                         read_mostly                             netdev_get_tx_queue(tx)
+unsigned_int                        num_tx_queues
+unsigned_int                        real_num_tx_queues          read_mostly                             skb_tx_hash,netdev_core_pick_tx(tx)
+unsigned_int                        tx_queue_len
+spinlock_t                          tx_global_lock
+struct xdp_dev_bulk_queue__percpu*  xdp_bulkq
+struct xps_dev_maps*                xps_maps[2]                 read_mostly                             __netif_set_xps_queue
+struct bpf_mprog_entry              tcx_egress                  read_mostly                             sch_handle_egress
+struct nf_hook_entries*             nf_hooks_egress             read_mostly
+struct hlist_head                   qdisc_hash[16]
+struct timer_list                   watchdog_timer
+int                                 watchdog_timeo
+u32                                 proto_down_reason
+struct list_head                    todo_list
+int__percpu*                        pcpu_refcnt
+refcount_t                          dev_refcnt
+struct ref_tracker_dir              refcnt_tracker
+struct list_head                    link_watch_list
+enum:8                              reg_state
+bool                                dismantle
+enum:16                             rtnl_link_state
+bool                                needs_free_netdev
+void*priv_destructor                struct net_device
+struct netpoll_info*                npinfo                                          read_mostly         napi_poll/napi_poll_lock
+possible_net_t                      nd_net                                          read_mostly         (dev_net)napi_busy_loop,tcp_v(4/6)_rcv,ip(v6)_rcv,ip(6)_input,ip(6)_input_finish
+void*                               ml_priv
+enum_netdev_ml_priv_type            ml_priv_type
+struct pcpu_lstats__percpu*         lstats                      read_mostly                             dev_lstats_add()
+struct pcpu_sw_netstats__percpu*    tstats                      read_mostly                             dev_sw_netstats_tx_add()
+struct pcpu_dstats__percpu*         dstats
+struct garp_port*                   garp_port
+struct mrp_port*                    mrp_port
+struct dm_hw_stat_delta*            dm_private
+struct device                       dev
+struct attribute_group*             sysfs_groups[4]
+struct attribute_group*             sysfs_rx_queue_group
+struct rtnl_link_ops*               rtnl_link_ops
+unsigned_int                        gso_max_size                read_mostly                             sk_dst_gso_max_size
+unsigned_int                        tso_max_size
+u16                                 gso_max_segs                read_mostly                             gso_max_segs
+u16                                 tso_max_segs
+unsigned_int                        gso_ipv4_max_size           read_mostly                             sk_dst_gso_max_size
+struct dcbnl_rtnl_ops*              dcbnl_ops
+s16                                 num_tc                      read_mostly                             skb_tx_hash
+struct netdev_tc_txq                tc_to_txq[16]               read_mostly                             skb_tx_hash
+u8                                  prio_tc_map[16]
+unsigned_int                        fcoe_ddp_xid
+struct netprio_map*                 priomap
+struct phy_device*                  phydev
+struct sfp_bus*                     sfp_bus
+struct lock_class_key*              qdisc_tx_busylock
+bool                                proto_down
+unsigned:1                          wol_enabled
+unsigned:1                          threaded                                                            napi_poll(napi_enable,dev_set_threaded)
+unsigned_long:1                     see_all_hwtstamp_requests
+unsigned_long:1                     change_proto_down
+unsigned_long:1                     netns_local
+unsigned_long:1                     fcoe_mtu
+struct list_head                    net_notifier_list
+struct macsec_ops*                  macsec_ops
+struct udp_tunnel_nic_info*         udp_tunnel_nic_info
+struct udp_tunnel_nic*              udp_tunnel_nic
+unsigned_int                        xdp_zc_max_segs
+struct bpf_xdp_entity               xdp_state[3]
+u8                                  dev_addr_shadow[32]
+netdevice_tracker                   linkwatch_dev_tracker
+netdevice_tracker                   watchdog_dev_tracker
+netdevice_tracker                   dev_registered_tracker
+struct rtnl_hw_stats64*             offload_xstats_l3
+struct devlink_port*                devlink_port
+struct dpll_pin*                    dpll_pin
 struct hlist_head                   page_pools
 struct dim_irq_moder*               irq_moder
 u64                                 max_pacing_offload_horizon
+=================================== =========================== =================== =================== ===================================================================================
diff --git a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
index 9b87089a84c6..392e08a6ec04 100644
--- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
+++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
@@ -5,154 +5,156 @@
 netns_ipv4 struct fast path usage breakdown
 ===========================================
 
+=============================== ============================================ =================== =================== =================================================
 Type                            Name                                         fastpath_tx_access  fastpath_rx_access  comment
-..struct                        ..netns_ipv4                                                                         
-struct_inet_timewait_death_row  tcp_death_row                                                                        
-struct_udp_table*               udp_table                                                                            
-struct_ctl_table_header*        forw_hdr                                                                             
-struct_ctl_table_header*        frags_hdr                                                                            
-struct_ctl_table_header*        ipv4_hdr                                                                             
-struct_ctl_table_header*        route_hdr                                                                            
-struct_ctl_table_header*        xfrm4_hdr                                                                            
-struct_ipv4_devconf*            devconf_all                                                                          
-struct_ipv4_devconf*            devconf_dflt                                                                         
-struct_ip_ra_chain              ra_chain                                                                             
-struct_mutex                    ra_mutex                                                                             
-struct_fib_rules_ops*           rules_ops                                                                            
-struct_fib_table                fib_main                                                                             
-struct_fib_table                fib_default                                                                          
-unsigned_int                    fib_rules_require_fldissect                                                          
-bool                            fib_has_custom_rules                                                                 
-bool                            fib_has_custom_local_routes                                                          
-bool                            fib_offload_disabled                                                                 
-atomic_t                        fib_num_tclassid_users                                                               
-struct_hlist_head*              fib_table_hash                                                                       
-struct_sock*                    fibnl                                                                                
-struct_sock*                    mc_autojoin_sk                                                                       
-struct_inet_peer_base*          peers                                                                                
-struct_fqdir*                   fqdir                                                                                
-u8                              sysctl_icmp_echo_ignore_all                                                          
-u8                              sysctl_icmp_echo_enable_probe                                                        
-u8                              sysctl_icmp_echo_ignore_broadcasts                                                   
-u8                              sysctl_icmp_ignore_bogus_error_responses                                             
-u8                              sysctl_icmp_errors_use_inbound_ifaddr                                                
-int                             sysctl_icmp_ratelimit                                                                
-int                             sysctl_icmp_ratemask                                                                 
-u32                             ip_rt_min_pmtu                               -                   -                   
-int                             ip_rt_mtu_expires                            -                   -                   
-int                             ip_rt_min_advmss                             -                   -                   
-struct_local_ports              ip_local_ports                               -                   -                   
-u8                              sysctl_tcp_ecn                               -                   -                   
-u8                              sysctl_tcp_ecn_fallback                      -                   -                   
-u8                              sysctl_ip_default_ttl                        -                   -                   ip4_dst_hoplimit/ip_select_ttl
-u8                              sysctl_ip_no_pmtu_disc                       -                   -                   
-u8                              sysctl_ip_fwd_use_pmtu                       read_mostly         -                   ip_dst_mtu_maybe_forward/ip_skb_dst_mtu
-u8                              sysctl_ip_fwd_update_priority                -                   -                   ip_forward
-u8                              sysctl_ip_nonlocal_bind                      -                   -                   
-u8                              sysctl_ip_autobind_reuse                     -                   -                   
-u8                              sysctl_ip_dynaddr                            -                   -                   
-u8                              sysctl_ip_early_demux                        -                   read_mostly         ip(6)_rcv_finish_core
-u8                              sysctl_raw_l3mdev_accept                     -                   -                   
-u8                              sysctl_tcp_early_demux                       -                   read_mostly         ip(6)_rcv_finish_core
-u8                              sysctl_udp_early_demux                                                               
-u8                              sysctl_nexthop_compat_mode                   -                   -                   
-u8                              sysctl_fwmark_reflect                        -                   -                   
-u8                              sysctl_tcp_fwmark_accept                     -                   -                   
-u8                              sysctl_tcp_l3mdev_accept                     -                   -                   
-u8                              sysctl_tcp_mtu_probing                       -                   -                   
-int                             sysctl_tcp_mtu_probe_floor                   -                   -                   
-int                             sysctl_tcp_base_mss                          -                   -                   
-int                             sysctl_tcp_min_snd_mss                       read_mostly         -                   __tcp_mtu_to_mss(tcp_write_xmit)
-int                             sysctl_tcp_probe_threshold                   -                   -                   tcp_mtu_probe(tcp_write_xmit)
-u32                             sysctl_tcp_probe_interval                    -                   -                   tcp_mtu_check_reprobe(tcp_write_xmit)
-int                             sysctl_tcp_keepalive_time                    -                   -                   
-int                             sysctl_tcp_keepalive_intvl                   -                   -                   
-u8                              sysctl_tcp_keepalive_probes                  -                   -                   
-u8                              sysctl_tcp_syn_retries                       -                   -                   
-u8                              sysctl_tcp_synack_retries                    -                   -                   
-u8                              sysctl_tcp_syncookies                        -                   -                   generated_on_syn
-u8                              sysctl_tcp_migrate_req                       -                   -                   reuseport
-u8                              sysctl_tcp_comp_sack_nr                      -                   -                   __tcp_ack_snd_check
-int                             sysctl_tcp_reordering                        -                   read_mostly         tcp_may_raise_cwnd/tcp_cong_control
-u8                              sysctl_tcp_retries1                          -                   -                   
-u8                              sysctl_tcp_retries2                          -                   -                   
-u8                              sysctl_tcp_orphan_retries                    -                   -                   
-u8                              sysctl_tcp_tw_reuse                          -                   -                   timewait_sock_ops
-int                             sysctl_tcp_fin_timeout                       -                   -                   TCP_LAST_ACK/tcp_rcv_state_process
-unsigned_int                    sysctl_tcp_notsent_lowat                     read_mostly         -                   tcp_notsent_lowat/tcp_stream_memory_free
-u8                              sysctl_tcp_sack                              -                   -                   tcp_syn_options
-u8                              sysctl_tcp_window_scaling                    -                   -                   tcp_syn_options,tcp_parse_options
-u8                              sysctl_tcp_timestamps                                                                
-u8                              sysctl_tcp_early_retrans                     read_mostly         -                   tcp_schedule_loss_probe(tcp_write_xmit)
-u8                              sysctl_tcp_recovery                          -                   -                   tcp_fastretrans_alert
-u8                              sysctl_tcp_thin_linear_timeouts              -                   -                   tcp_retrans_timer(on_thin_streams)
-u8                              sysctl_tcp_slow_start_after_idle             -                   -                   unlikely(tcp_cwnd_validate-network-not-starved)
-u8                              sysctl_tcp_retrans_collapse                  -                   -                   
-u8                              sysctl_tcp_stdurg                            -                   -                   unlikely(tcp_check_urg)
-u8                              sysctl_tcp_rfc1337                           -                   -                   
-u8                              sysctl_tcp_abort_on_overflow                 -                   -                   
-u8                              sysctl_tcp_fack                              -                   -                   
-int                             sysctl_tcp_max_reordering                    -                   -                   tcp_check_sack_reordering
-int                             sysctl_tcp_adv_win_scale                     -                   -                   tcp_init_buffer_space
-u8                              sysctl_tcp_dsack                             -                   -                   partial_packet_or_retrans_in_tcp_data_queue
-u8                              sysctl_tcp_app_win                           -                   -                   tcp_win_from_space
-u8                              sysctl_tcp_frto                              -                   -                   tcp_enter_loss
-u8                              sysctl_tcp_nometrics_save                    -                   -                   TCP_LAST_ACK/tcp_update_metrics
-u8                              sysctl_tcp_no_ssthresh_metrics_save          -                   -                   TCP_LAST_ACK/tcp_(update/init)_metrics
+=============================== ============================================ =================== =================== =================================================
+struct_inet_timewait_death_row  tcp_death_row
+struct_udp_table*               udp_table
+struct_ctl_table_header*        forw_hdr
+struct_ctl_table_header*        frags_hdr
+struct_ctl_table_header*        ipv4_hdr
+struct_ctl_table_header*        route_hdr
+struct_ctl_table_header*        xfrm4_hdr
+struct_ipv4_devconf*            devconf_all
+struct_ipv4_devconf*            devconf_dflt
+struct_ip_ra_chain              ra_chain
+struct_mutex                    ra_mutex
+struct_fib_rules_ops*           rules_ops
+struct_fib_table                fib_main
+struct_fib_table                fib_default
+unsigned_int                    fib_rules_require_fldissect
+bool                            fib_has_custom_rules
+bool                            fib_has_custom_local_routes
+bool                            fib_offload_disabled
+atomic_t                        fib_num_tclassid_users
+struct_hlist_head*              fib_table_hash
+struct_sock*                    fibnl
+struct_sock*                    mc_autojoin_sk
+struct_inet_peer_base*          peers
+struct_fqdir*                   fqdir
+u8                              sysctl_icmp_echo_ignore_all
+u8                              sysctl_icmp_echo_enable_probe
+u8                              sysctl_icmp_echo_ignore_broadcasts
+u8                              sysctl_icmp_ignore_bogus_error_responses
+u8                              sysctl_icmp_errors_use_inbound_ifaddr
+int                             sysctl_icmp_ratelimit
+int                             sysctl_icmp_ratemask
+u32                             ip_rt_min_pmtu
+int                             ip_rt_mtu_expires
+int                             ip_rt_min_advmss
+struct_local_ports              ip_local_ports
+u8                              sysctl_tcp_ecn
+u8                              sysctl_tcp_ecn_fallback
+u8                              sysctl_ip_default_ttl                                                                ip4_dst_hoplimit/ip_select_ttl
+u8                              sysctl_ip_no_pmtu_disc
+u8                              sysctl_ip_fwd_use_pmtu                       read_mostly                             ip_dst_mtu_maybe_forward/ip_skb_dst_mtu
+u8                              sysctl_ip_fwd_update_priority                                                        ip_forward
+u8                              sysctl_ip_nonlocal_bind
+u8                              sysctl_ip_autobind_reuse
+u8                              sysctl_ip_dynaddr
+u8                              sysctl_ip_early_demux                                            read_mostly         ip(6)_rcv_finish_core
+u8                              sysctl_raw_l3mdev_accept
+u8                              sysctl_tcp_early_demux                                           read_mostly         ip(6)_rcv_finish_core
+u8                              sysctl_udp_early_demux
+u8                              sysctl_nexthop_compat_mode
+u8                              sysctl_fwmark_reflect
+u8                              sysctl_tcp_fwmark_accept
+u8                              sysctl_tcp_l3mdev_accept
+u8                              sysctl_tcp_mtu_probing
+int                             sysctl_tcp_mtu_probe_floor
+int                             sysctl_tcp_base_mss
+int                             sysctl_tcp_min_snd_mss                       read_mostly                             __tcp_mtu_to_mss(tcp_write_xmit)
+int                             sysctl_tcp_probe_threshold                                                           tcp_mtu_probe(tcp_write_xmit)
+u32                             sysctl_tcp_probe_interval                                                            tcp_mtu_check_reprobe(tcp_write_xmit)
+int                             sysctl_tcp_keepalive_time
+int                             sysctl_tcp_keepalive_intvl
+u8                              sysctl_tcp_keepalive_probes
+u8                              sysctl_tcp_syn_retries
+u8                              sysctl_tcp_synack_retries
+u8                              sysctl_tcp_syncookies                                                                generated_on_syn
+u8                              sysctl_tcp_migrate_req                                                               reuseport
+u8                              sysctl_tcp_comp_sack_nr                                                              __tcp_ack_snd_check
+int                             sysctl_tcp_reordering                                            read_mostly         tcp_may_raise_cwnd/tcp_cong_control
+u8                              sysctl_tcp_retries1
+u8                              sysctl_tcp_retries2
+u8                              sysctl_tcp_orphan_retries
+u8                              sysctl_tcp_tw_reuse                                                                  timewait_sock_ops
+int                             sysctl_tcp_fin_timeout                                                               TCP_LAST_ACK/tcp_rcv_state_process
+unsigned_int                    sysctl_tcp_notsent_lowat                     read_mostly                             tcp_notsent_lowat/tcp_stream_memory_free
+u8                              sysctl_tcp_sack                                                                      tcp_syn_options
+u8                              sysctl_tcp_window_scaling                                                            tcp_syn_options,tcp_parse_options
+u8                              sysctl_tcp_timestamps
+u8                              sysctl_tcp_early_retrans                     read_mostly                             tcp_schedule_loss_probe(tcp_write_xmit)
+u8                              sysctl_tcp_recovery                                                                  tcp_fastretrans_alert
+u8                              sysctl_tcp_thin_linear_timeouts                                                      tcp_retrans_timer(on_thin_streams)
+u8                              sysctl_tcp_slow_start_after_idle                                                     unlikely(tcp_cwnd_validate-network-not-starved)
+u8                              sysctl_tcp_retrans_collapse
+u8                              sysctl_tcp_stdurg                                                                    unlikely(tcp_check_urg)
+u8                              sysctl_tcp_rfc1337
+u8                              sysctl_tcp_abort_on_overflow
+u8                              sysctl_tcp_fack
+int                             sysctl_tcp_max_reordering                                                            tcp_check_sack_reordering
+int                             sysctl_tcp_adv_win_scale                                                             tcp_init_buffer_space
+u8                              sysctl_tcp_dsack                                                                     partial_packet_or_retrans_in_tcp_data_queue
+u8                              sysctl_tcp_app_win                                                                   tcp_win_from_space
+u8                              sysctl_tcp_frto                                                                      tcp_enter_loss
+u8                              sysctl_tcp_nometrics_save                                                            TCP_LAST_ACK/tcp_update_metrics
+u8                              sysctl_tcp_no_ssthresh_metrics_save                                                  TCP_LAST_ACK/tcp_(update/init)_metrics
 u8                              sysctl_tcp_moderate_rcvbuf                   read_mostly         read_mostly         tcp_tso_should_defer(tx);tcp_rcv_space_adjust(rx)
-u8                              sysctl_tcp_tso_win_divisor                   read_mostly         -                   tcp_tso_should_defer(tcp_write_xmit)
-u8                              sysctl_tcp_workaround_signed_windows         -                   -                   tcp_select_window
-int                             sysctl_tcp_limit_output_bytes                read_mostly         -                   tcp_small_queue_check(tcp_write_xmit)
-int                             sysctl_tcp_challenge_ack_limit               -                   -                   
-int                             sysctl_tcp_min_rtt_wlen                      read_mostly         -                   tcp_ack_update_rtt
-u8                              sysctl_tcp_min_tso_segs                      -                   -                   unlikely(icsk_ca_ops-written)
-u8                              sysctl_tcp_tso_rtt_log                       read_mostly         -                   tcp_tso_autosize
-u8                              sysctl_tcp_autocorking                       read_mostly         -                   tcp_push/tcp_should_autocork
-u8                              sysctl_tcp_reflect_tos                       -                   -                   tcp_v(4/6)_send_synack
-int                             sysctl_tcp_invalid_ratelimit                 -                   -                   
-int                             sysctl_tcp_pacing_ss_ratio                   -                   -                   default_cong_cont(tcp_update_pacing_rate)
-int                             sysctl_tcp_pacing_ca_ratio                   -                   -                   default_cong_cont(tcp_update_pacing_rate)
-int                             sysctl_tcp_wmem[3]                           read_mostly         -                   tcp_wmem_schedule(sendmsg/sendpage)
-int                             sysctl_tcp_rmem[3]                           -                   read_mostly         __tcp_grow_window(tx),tcp_rcv_space_adjust(rx)
-unsigned_int                    sysctl_tcp_child_ehash_entries                                                       
-unsigned_long                   sysctl_tcp_comp_sack_delay_ns                -                   -                   __tcp_ack_snd_check
-unsigned_long                   sysctl_tcp_comp_sack_slack_ns                -                   -                   __tcp_ack_snd_check
-int                             sysctl_max_syn_backlog                       -                   -                   
-int                             sysctl_tcp_fastopen                          -                   -                   
-struct_tcp_congestion_ops       tcp_congestion_control                       -                   -                   init_cc
-struct_tcp_fastopen_context     tcp_fastopen_ctx                             -                   -                   
-unsigned_int                    sysctl_tcp_fastopen_blackhole_timeout        -                   -                   
-atomic_t                        tfo_active_disable_times                     -                   -                   
-unsigned_long                   tfo_active_disable_stamp                     -                   -                   
-u32                             tcp_challenge_timestamp                      -                   -                   
-u32                             tcp_challenge_count                          -                   -                   
-u8                              sysctl_tcp_plb_enabled                       -                   -                   
-u8                              sysctl_tcp_plb_idle_rehash_rounds            -                   -                   
-u8                              sysctl_tcp_plb_rehash_rounds                 -                   -                   
-u8                              sysctl_tcp_plb_suspend_rto_sec               -                   -                   
-int                             sysctl_tcp_plb_cong_thresh                   -                   -                   
-int                             sysctl_udp_wmem_min                                                                  
-int                             sysctl_udp_rmem_min                                                                  
-u8                              sysctl_fib_notify_on_flag_change                                                     
-u8                              sysctl_udp_l3mdev_accept                                                             
-u8                              sysctl_igmp_llm_reports                                                              
-int                             sysctl_igmp_max_memberships                                                          
-int                             sysctl_igmp_max_msf                                                                  
-int                             sysctl_igmp_qrv                                                                      
-struct_ping_group_range         ping_group_range                                                                     
-atomic_t                        dev_addr_genid                                                                       
-unsigned_int                    sysctl_udp_child_hash_entries                                                        
-unsigned_long*                  sysctl_local_reserved_ports                                                          
-int                             sysctl_ip_prot_sock                                                                  
-struct_mr_table*                mrt                                                                                  
-struct_list_head                mr_tables                                                                            
-struct_fib_rules_ops*           mr_rules_ops                                                                         
-u32                             sysctl_fib_multipath_hash_fields                                                     
-u8                              sysctl_fib_multipath_use_neigh                                                       
-u8                              sysctl_fib_multipath_hash_policy                                                     
-struct_fib_notifier_ops*        notifier_ops                                                                         
-unsigned_int                    fib_seq                                                                              
-struct_fib_notifier_ops*        ipmr_notifier_ops                                                                    
-unsigned_int                    ipmr_seq                                                                             
-atomic_t                        rt_genid                                                                             
-siphash_key_t                   ip_id_key                                                                                      
+u8                              sysctl_tcp_tso_win_divisor                   read_mostly                             tcp_tso_should_defer(tcp_write_xmit)
+u8                              sysctl_tcp_workaround_signed_windows                                                 tcp_select_window
+int                             sysctl_tcp_limit_output_bytes                read_mostly                             tcp_small_queue_check(tcp_write_xmit)
+int                             sysctl_tcp_challenge_ack_limit
+int                             sysctl_tcp_min_rtt_wlen                      read_mostly                             tcp_ack_update_rtt
+u8                              sysctl_tcp_min_tso_segs                                                              unlikely(icsk_ca_ops-written)
+u8                              sysctl_tcp_tso_rtt_log                       read_mostly                             tcp_tso_autosize
+u8                              sysctl_tcp_autocorking                       read_mostly                             tcp_push/tcp_should_autocork
+u8                              sysctl_tcp_reflect_tos                                                               tcp_v(4/6)_send_synack
+int                             sysctl_tcp_invalid_ratelimit
+int                             sysctl_tcp_pacing_ss_ratio                                                           default_cong_cont(tcp_update_pacing_rate)
+int                             sysctl_tcp_pacing_ca_ratio                                                           default_cong_cont(tcp_update_pacing_rate)
+int                             sysctl_tcp_wmem[3]                           read_mostly                             tcp_wmem_schedule(sendmsg/sendpage)
+int                             sysctl_tcp_rmem[3]                                               read_mostly         __tcp_grow_window(tx),tcp_rcv_space_adjust(rx)
+unsigned_int                    sysctl_tcp_child_ehash_entries
+unsigned_long                   sysctl_tcp_comp_sack_delay_ns                                                        __tcp_ack_snd_check
+unsigned_long                   sysctl_tcp_comp_sack_slack_ns                                                        __tcp_ack_snd_check
+int                             sysctl_max_syn_backlog
+int                             sysctl_tcp_fastopen
+struct_tcp_congestion_ops       tcp_congestion_control                                                               init_cc
+struct_tcp_fastopen_context     tcp_fastopen_ctx
+unsigned_int                    sysctl_tcp_fastopen_blackhole_timeout
+atomic_t                        tfo_active_disable_times
+unsigned_long                   tfo_active_disable_stamp
+u32                             tcp_challenge_timestamp
+u32                             tcp_challenge_count
+u8                              sysctl_tcp_plb_enabled
+u8                              sysctl_tcp_plb_idle_rehash_rounds
+u8                              sysctl_tcp_plb_rehash_rounds
+u8                              sysctl_tcp_plb_suspend_rto_sec
+int                             sysctl_tcp_plb_cong_thresh
+int                             sysctl_udp_wmem_min
+int                             sysctl_udp_rmem_min
+u8                              sysctl_fib_notify_on_flag_change
+u8                              sysctl_udp_l3mdev_accept
+u8                              sysctl_igmp_llm_reports
+int                             sysctl_igmp_max_memberships
+int                             sysctl_igmp_max_msf
+int                             sysctl_igmp_qrv
+struct_ping_group_range         ping_group_range
+atomic_t                        dev_addr_genid
+unsigned_int                    sysctl_udp_child_hash_entries
+unsigned_long*                  sysctl_local_reserved_ports
+int                             sysctl_ip_prot_sock
+struct_mr_table*                mrt
+struct_list_head                mr_tables
+struct_fib_rules_ops*           mr_rules_ops
+u32                             sysctl_fib_multipath_hash_fields
+u8                              sysctl_fib_multipath_use_neigh
+u8                              sysctl_fib_multipath_hash_policy
+struct_fib_notifier_ops*        notifier_ops
+unsigned_int                    fib_seq
+struct_fib_notifier_ops*        ipmr_notifier_ops
+unsigned_int                    ipmr_seq
+atomic_t                        rt_genid
+siphash_key_t                   ip_id_key
+=============================== ============================================ =================== =================== =================================================
diff --git a/Documentation/networking/net_cachelines/snmp.rst b/Documentation/networking/net_cachelines/snmp.rst
index 6a071538566c..90ca2d92547d 100644
--- a/Documentation/networking/net_cachelines/snmp.rst
+++ b/Documentation/networking/net_cachelines/snmp.rst
@@ -5,131 +5,133 @@
 netns_ipv4 enum fast path usage breakdown
 ===========================================
 
+============== ===================================== =================== =================== ==================================================
 Type           Name                                  fastpath_tx_access  fastpath_rx_access  comment
-..enum                                                                                       
-unsigned_long  LINUX_MIB_TCPKEEPALIVE                write_mostly        -                   tcp_keepalive_timer
-unsigned_long  LINUX_MIB_DELAYEDACKS                 write_mostly        -                   tcp_delack_timer_handler,tcp_delack_timer
-unsigned_long  LINUX_MIB_DELAYEDACKLOCKED            write_mostly        -                   tcp_delack_timer_handler,tcp_delack_timer
-unsigned_long  LINUX_MIB_TCPAUTOCORKING              write_mostly        -                   tcp_push,tcp_sendmsg_locked
-unsigned_long  LINUX_MIB_TCPFROMZEROWINDOWADV        write_mostly        -                   tcp_select_window,tcp_transmit-skb
-unsigned_long  LINUX_MIB_TCPTOZEROWINDOWADV          write_mostly        -                   tcp_select_window,tcp_transmit-skb
-unsigned_long  LINUX_MIB_TCPWANTZEROWINDOWADV        write_mostly        -                   tcp_select_window,tcp_transmit-skb
-unsigned_long  LINUX_MIB_TCPORIGDATASENT             write_mostly        -                   tcp_write_xmit
-unsigned_long  LINUX_MIB_TCPHPHITS                   -                   write_mostly        tcp_rcv_established,tcp_v4_do_rcv,tcp_v6_do_rcv
-unsigned_long  LINUX_MIB_TCPRCVCOALESCE              -                   write_mostly        tcp_try_coalesce,tcp_queue_rcv,tcp_rcv_established
-unsigned_long  LINUX_MIB_TCPPUREACKS                 -                   write_mostly        tcp_ack,tcp_rcv_established
-unsigned_long  LINUX_MIB_TCPHPACKS                   -                   write_mostly        tcp_ack,tcp_rcv_established
-unsigned_long  LINUX_MIB_TCPDELIVERED                -                   write_mostly        tcp_newly_delivered,tcp_ack,tcp_rcv_established
-unsigned_long  LINUX_MIB_SYNCOOKIESSENT                                                      
-unsigned_long  LINUX_MIB_SYNCOOKIESRECV                                                      
-unsigned_long  LINUX_MIB_SYNCOOKIESFAILED                                                    
-unsigned_long  LINUX_MIB_EMBRYONICRSTS                                                       
-unsigned_long  LINUX_MIB_PRUNECALLED                                                         
-unsigned_long  LINUX_MIB_RCVPRUNED                                                           
-unsigned_long  LINUX_MIB_OFOPRUNED                                                           
-unsigned_long  LINUX_MIB_OUTOFWINDOWICMPS                                                    
-unsigned_long  LINUX_MIB_LOCKDROPPEDICMPS                                                    
-unsigned_long  LINUX_MIB_ARPFILTER                                                           
-unsigned_long  LINUX_MIB_TIMEWAITED                                                          
-unsigned_long  LINUX_MIB_TIMEWAITRECYCLED                                                    
-unsigned_long  LINUX_MIB_TIMEWAITKILLED                                                      
-unsigned_long  LINUX_MIB_PAWSACTIVEREJECTED                                                  
-unsigned_long  LINUX_MIB_PAWSESTABREJECTED                                                   
-unsigned_long  LINUX_MIB_DELAYEDACKLOST                                                      
-unsigned_long  LINUX_MIB_LISTENOVERFLOWS                                                     
-unsigned_long  LINUX_MIB_LISTENDROPS                                                         
-unsigned_long  LINUX_MIB_TCPRENORECOVERY                                                     
-unsigned_long  LINUX_MIB_TCPSACKRECOVERY                                                     
-unsigned_long  LINUX_MIB_TCPSACKRENEGING                                                     
-unsigned_long  LINUX_MIB_TCPSACKREORDER                                                      
-unsigned_long  LINUX_MIB_TCPRENOREORDER                                                      
-unsigned_long  LINUX_MIB_TCPTSREORDER                                                        
-unsigned_long  LINUX_MIB_TCPFULLUNDO                                                         
-unsigned_long  LINUX_MIB_TCPPARTIALUNDO                                                      
-unsigned_long  LINUX_MIB_TCPDSACKUNDO                                                        
-unsigned_long  LINUX_MIB_TCPLOSSUNDO                                                         
-unsigned_long  LINUX_MIB_TCPLOSTRETRANSMIT                                                   
-unsigned_long  LINUX_MIB_TCPRENOFAILURES                                                     
-unsigned_long  LINUX_MIB_TCPSACKFAILURES                                                     
-unsigned_long  LINUX_MIB_TCPLOSSFAILURES                                                     
-unsigned_long  LINUX_MIB_TCPFASTRETRANS                                                      
-unsigned_long  LINUX_MIB_TCPSLOWSTARTRETRANS                                                 
-unsigned_long  LINUX_MIB_TCPTIMEOUTS                                                         
-unsigned_long  LINUX_MIB_TCPLOSSPROBES                                                       
-unsigned_long  LINUX_MIB_TCPLOSSPROBERECOVERY                                                
-unsigned_long  LINUX_MIB_TCPRENORECOVERYFAIL                                                 
-unsigned_long  LINUX_MIB_TCPSACKRECOVERYFAIL                                                 
-unsigned_long  LINUX_MIB_TCPRCVCOLLAPSED                                                     
-unsigned_long  LINUX_MIB_TCPDSACKOLDSENT                                                     
-unsigned_long  LINUX_MIB_TCPDSACKOFOSENT                                                     
-unsigned_long  LINUX_MIB_TCPDSACKRECV                                                        
-unsigned_long  LINUX_MIB_TCPDSACKOFORECV                                                     
-unsigned_long  LINUX_MIB_TCPABORTONDATA                                                      
-unsigned_long  LINUX_MIB_TCPABORTONCLOSE                                                     
-unsigned_long  LINUX_MIB_TCPABORTONMEMORY                                                    
-unsigned_long  LINUX_MIB_TCPABORTONTIMEOUT                                                   
-unsigned_long  LINUX_MIB_TCPABORTONLINGER                                                    
-unsigned_long  LINUX_MIB_TCPABORTFAILED                                                      
-unsigned_long  LINUX_MIB_TCPMEMORYPRESSURES                                                  
-unsigned_long  LINUX_MIB_TCPMEMORYPRESSURESCHRONO                                            
-unsigned_long  LINUX_MIB_TCPSACKDISCARD                                                      
-unsigned_long  LINUX_MIB_TCPDSACKIGNOREDOLD                                                  
-unsigned_long  LINUX_MIB_TCPDSACKIGNOREDNOUNDO                                               
-unsigned_long  LINUX_MIB_TCPSPURIOUSRTOS                                                     
-unsigned_long  LINUX_MIB_TCPMD5NOTFOUND                                                      
-unsigned_long  LINUX_MIB_TCPMD5UNEXPECTED                                                    
-unsigned_long  LINUX_MIB_TCPMD5FAILURE                                                       
-unsigned_long  LINUX_MIB_SACKSHIFTED                                                         
-unsigned_long  LINUX_MIB_SACKMERGED                                                          
-unsigned_long  LINUX_MIB_SACKSHIFTFALLBACK                                                   
-unsigned_long  LINUX_MIB_TCPBACKLOGDROP                                                      
-unsigned_long  LINUX_MIB_PFMEMALLOCDROP                                                      
-unsigned_long  LINUX_MIB_TCPMINTTLDROP                                                       
-unsigned_long  LINUX_MIB_TCPDEFERACCEPTDROP                                                  
-unsigned_long  LINUX_MIB_IPRPFILTER                                                          
-unsigned_long  LINUX_MIB_TCPTIMEWAITOVERFLOW                                                 
-unsigned_long  LINUX_MIB_TCPREQQFULLDOCOOKIES                                                
-unsigned_long  LINUX_MIB_TCPREQQFULLDROP                                                     
-unsigned_long  LINUX_MIB_TCPRETRANSFAIL                                                      
-unsigned_long  LINUX_MIB_TCPBACKLOGCOALESCE                                                  
-unsigned_long  LINUX_MIB_TCPOFOQUEUE                                                         
-unsigned_long  LINUX_MIB_TCPOFODROP                                                          
-unsigned_long  LINUX_MIB_TCPOFOMERGE                                                         
-unsigned_long  LINUX_MIB_TCPCHALLENGEACK                                                     
-unsigned_long  LINUX_MIB_TCPSYNCHALLENGE                                                     
-unsigned_long  LINUX_MIB_TCPFASTOPENACTIVE                                                   
-unsigned_long  LINUX_MIB_TCPFASTOPENACTIVEFAIL                                               
-unsigned_long  LINUX_MIB_TCPFASTOPENPASSIVE                                                  
-unsigned_long  LINUX_MIB_TCPFASTOPENPASSIVEFAIL                                              
-unsigned_long  LINUX_MIB_TCPFASTOPENLISTENOVERFLOW                                           
-unsigned_long  LINUX_MIB_TCPFASTOPENCOOKIEREQD                                               
-unsigned_long  LINUX_MIB_TCPFASTOPENBLACKHOLE                                                
-unsigned_long  LINUX_MIB_TCPSPURIOUS_RTX_HOSTQUEUES                                          
-unsigned_long  LINUX_MIB_BUSYPOLLRXPACKETS                                                   
-unsigned_long  LINUX_MIB_TCPSYNRETRANS                                                       
-unsigned_long  LINUX_MIB_TCPHYSTARTTRAINDETECT                                               
-unsigned_long  LINUX_MIB_TCPHYSTARTTRAINCWND                                                 
-unsigned_long  LINUX_MIB_TCPHYSTARTDELAYDETECT                                               
-unsigned_long  LINUX_MIB_TCPHYSTARTDELAYCWND                                                 
-unsigned_long  LINUX_MIB_TCPACKSKIPPEDSYNRECV                                                
-unsigned_long  LINUX_MIB_TCPACKSKIPPEDPAWS                                                   
-unsigned_long  LINUX_MIB_TCPACKSKIPPEDSEQ                                                    
-unsigned_long  LINUX_MIB_TCPACKSKIPPEDFINWAIT2                                               
-unsigned_long  LINUX_MIB_TCPACKSKIPPEDTIMEWAIT                                               
-unsigned_long  LINUX_MIB_TCPACKSKIPPEDCHALLENGE                                              
-unsigned_long  LINUX_MIB_TCPWINPROBE                                                         
-unsigned_long  LINUX_MIB_TCPMTUPFAIL                                                         
-unsigned_long  LINUX_MIB_TCPMTUPSUCCESS                                                      
-unsigned_long  LINUX_MIB_TCPDELIVEREDCE                                                      
-unsigned_long  LINUX_MIB_TCPACKCOMPRESSED                                                    
-unsigned_long  LINUX_MIB_TCPZEROWINDOWDROP                                                   
-unsigned_long  LINUX_MIB_TCPRCVQDROP                                                         
-unsigned_long  LINUX_MIB_TCPWQUEUETOOBIG                                                     
-unsigned_long  LINUX_MIB_TCPFASTOPENPASSIVEALTKEY                                            
-unsigned_long  LINUX_MIB_TCPTIMEOUTREHASH                                                    
-unsigned_long  LINUX_MIB_TCPDUPLICATEDATAREHASH                                              
-unsigned_long  LINUX_MIB_TCPDSACKRECVSEGS                                                    
-unsigned_long  LINUX_MIB_TCPDSACKIGNOREDDUBIOUS                                              
-unsigned_long  LINUX_MIB_TCPMIGRATEREQSUCCESS                                                
-unsigned_long  LINUX_MIB_TCPMIGRATEREQFAILURE                                                
-unsigned_long  __LINUX_MIB_MAX                                                               
+============== ===================================== =================== =================== ==================================================
+unsigned_long  LINUX_MIB_TCPKEEPALIVE                write_mostly                            tcp_keepalive_timer
+unsigned_long  LINUX_MIB_DELAYEDACKS                 write_mostly                            tcp_delack_timer_handler,tcp_delack_timer
+unsigned_long  LINUX_MIB_DELAYEDACKLOCKED            write_mostly                            tcp_delack_timer_handler,tcp_delack_timer
+unsigned_long  LINUX_MIB_TCPAUTOCORKING              write_mostly                            tcp_push,tcp_sendmsg_locked
+unsigned_long  LINUX_MIB_TCPFROMZEROWINDOWADV        write_mostly                            tcp_select_window,tcp_transmit-skb
+unsigned_long  LINUX_MIB_TCPTOZEROWINDOWADV          write_mostly                            tcp_select_window,tcp_transmit-skb
+unsigned_long  LINUX_MIB_TCPWANTZEROWINDOWADV        write_mostly                            tcp_select_window,tcp_transmit-skb
+unsigned_long  LINUX_MIB_TCPORIGDATASENT             write_mostly                            tcp_write_xmit
+unsigned_long  LINUX_MIB_TCPHPHITS                                       write_mostly        tcp_rcv_established,tcp_v4_do_rcv,tcp_v6_do_rcv
+unsigned_long  LINUX_MIB_TCPRCVCOALESCE                                  write_mostly        tcp_try_coalesce,tcp_queue_rcv,tcp_rcv_established
+unsigned_long  LINUX_MIB_TCPPUREACKS                                     write_mostly        tcp_ack,tcp_rcv_established
+unsigned_long  LINUX_MIB_TCPHPACKS                                       write_mostly        tcp_ack,tcp_rcv_established
+unsigned_long  LINUX_MIB_TCPDELIVERED                                    write_mostly        tcp_newly_delivered,tcp_ack,tcp_rcv_established
+unsigned_long  LINUX_MIB_SYNCOOKIESSENT
+unsigned_long  LINUX_MIB_SYNCOOKIESRECV
+unsigned_long  LINUX_MIB_SYNCOOKIESFAILED
+unsigned_long  LINUX_MIB_EMBRYONICRSTS
+unsigned_long  LINUX_MIB_PRUNECALLED
+unsigned_long  LINUX_MIB_RCVPRUNED
+unsigned_long  LINUX_MIB_OFOPRUNED
+unsigned_long  LINUX_MIB_OUTOFWINDOWICMPS
+unsigned_long  LINUX_MIB_LOCKDROPPEDICMPS
+unsigned_long  LINUX_MIB_ARPFILTER
+unsigned_long  LINUX_MIB_TIMEWAITED
+unsigned_long  LINUX_MIB_TIMEWAITRECYCLED
+unsigned_long  LINUX_MIB_TIMEWAITKILLED
+unsigned_long  LINUX_MIB_PAWSACTIVEREJECTED
+unsigned_long  LINUX_MIB_PAWSESTABREJECTED
+unsigned_long  LINUX_MIB_DELAYEDACKLOST
+unsigned_long  LINUX_MIB_LISTENOVERFLOWS
+unsigned_long  LINUX_MIB_LISTENDROPS
+unsigned_long  LINUX_MIB_TCPRENORECOVERY
+unsigned_long  LINUX_MIB_TCPSACKRECOVERY
+unsigned_long  LINUX_MIB_TCPSACKRENEGING
+unsigned_long  LINUX_MIB_TCPSACKREORDER
+unsigned_long  LINUX_MIB_TCPRENOREORDER
+unsigned_long  LINUX_MIB_TCPTSREORDER
+unsigned_long  LINUX_MIB_TCPFULLUNDO
+unsigned_long  LINUX_MIB_TCPPARTIALUNDO
+unsigned_long  LINUX_MIB_TCPDSACKUNDO
+unsigned_long  LINUX_MIB_TCPLOSSUNDO
+unsigned_long  LINUX_MIB_TCPLOSTRETRANSMIT
+unsigned_long  LINUX_MIB_TCPRENOFAILURES
+unsigned_long  LINUX_MIB_TCPSACKFAILURES
+unsigned_long  LINUX_MIB_TCPLOSSFAILURES
+unsigned_long  LINUX_MIB_TCPFASTRETRANS
+unsigned_long  LINUX_MIB_TCPSLOWSTARTRETRANS
+unsigned_long  LINUX_MIB_TCPTIMEOUTS
+unsigned_long  LINUX_MIB_TCPLOSSPROBES
+unsigned_long  LINUX_MIB_TCPLOSSPROBERECOVERY
+unsigned_long  LINUX_MIB_TCPRENORECOVERYFAIL
+unsigned_long  LINUX_MIB_TCPSACKRECOVERYFAIL
+unsigned_long  LINUX_MIB_TCPRCVCOLLAPSED
+unsigned_long  LINUX_MIB_TCPDSACKOLDSENT
+unsigned_long  LINUX_MIB_TCPDSACKOFOSENT
+unsigned_long  LINUX_MIB_TCPDSACKRECV
+unsigned_long  LINUX_MIB_TCPDSACKOFORECV
+unsigned_long  LINUX_MIB_TCPABORTONDATA
+unsigned_long  LINUX_MIB_TCPABORTONCLOSE
+unsigned_long  LINUX_MIB_TCPABORTONMEMORY
+unsigned_long  LINUX_MIB_TCPABORTONTIMEOUT
+unsigned_long  LINUX_MIB_TCPABORTONLINGER
+unsigned_long  LINUX_MIB_TCPABORTFAILED
+unsigned_long  LINUX_MIB_TCPMEMORYPRESSURES
+unsigned_long  LINUX_MIB_TCPMEMORYPRESSURESCHRONO
+unsigned_long  LINUX_MIB_TCPSACKDISCARD
+unsigned_long  LINUX_MIB_TCPDSACKIGNOREDOLD
+unsigned_long  LINUX_MIB_TCPDSACKIGNOREDNOUNDO
+unsigned_long  LINUX_MIB_TCPSPURIOUSRTOS
+unsigned_long  LINUX_MIB_TCPMD5NOTFOUND
+unsigned_long  LINUX_MIB_TCPMD5UNEXPECTED
+unsigned_long  LINUX_MIB_TCPMD5FAILURE
+unsigned_long  LINUX_MIB_SACKSHIFTED
+unsigned_long  LINUX_MIB_SACKMERGED
+unsigned_long  LINUX_MIB_SACKSHIFTFALLBACK
+unsigned_long  LINUX_MIB_TCPBACKLOGDROP
+unsigned_long  LINUX_MIB_PFMEMALLOCDROP
+unsigned_long  LINUX_MIB_TCPMINTTLDROP
+unsigned_long  LINUX_MIB_TCPDEFERACCEPTDROP
+unsigned_long  LINUX_MIB_IPRPFILTER
+unsigned_long  LINUX_MIB_TCPTIMEWAITOVERFLOW
+unsigned_long  LINUX_MIB_TCPREQQFULLDOCOOKIES
+unsigned_long  LINUX_MIB_TCPREQQFULLDROP
+unsigned_long  LINUX_MIB_TCPRETRANSFAIL
+unsigned_long  LINUX_MIB_TCPBACKLOGCOALESCE
+unsigned_long  LINUX_MIB_TCPOFOQUEUE
+unsigned_long  LINUX_MIB_TCPOFODROP
+unsigned_long  LINUX_MIB_TCPOFOMERGE
+unsigned_long  LINUX_MIB_TCPCHALLENGEACK
+unsigned_long  LINUX_MIB_TCPSYNCHALLENGE
+unsigned_long  LINUX_MIB_TCPFASTOPENACTIVE
+unsigned_long  LINUX_MIB_TCPFASTOPENACTIVEFAIL
+unsigned_long  LINUX_MIB_TCPFASTOPENPASSIVE
+unsigned_long  LINUX_MIB_TCPFASTOPENPASSIVEFAIL
+unsigned_long  LINUX_MIB_TCPFASTOPENLISTENOVERFLOW
+unsigned_long  LINUX_MIB_TCPFASTOPENCOOKIEREQD
+unsigned_long  LINUX_MIB_TCPFASTOPENBLACKHOLE
+unsigned_long  LINUX_MIB_TCPSPURIOUS_RTX_HOSTQUEUES
+unsigned_long  LINUX_MIB_BUSYPOLLRXPACKETS
+unsigned_long  LINUX_MIB_TCPSYNRETRANS
+unsigned_long  LINUX_MIB_TCPHYSTARTTRAINDETECT
+unsigned_long  LINUX_MIB_TCPHYSTARTTRAINCWND
+unsigned_long  LINUX_MIB_TCPHYSTARTDELAYDETECT
+unsigned_long  LINUX_MIB_TCPHYSTARTDELAYCWND
+unsigned_long  LINUX_MIB_TCPACKSKIPPEDSYNRECV
+unsigned_long  LINUX_MIB_TCPACKSKIPPEDPAWS
+unsigned_long  LINUX_MIB_TCPACKSKIPPEDSEQ
+unsigned_long  LINUX_MIB_TCPACKSKIPPEDFINWAIT2
+unsigned_long  LINUX_MIB_TCPACKSKIPPEDTIMEWAIT
+unsigned_long  LINUX_MIB_TCPACKSKIPPEDCHALLENGE
+unsigned_long  LINUX_MIB_TCPWINPROBE
+unsigned_long  LINUX_MIB_TCPMTUPFAIL
+unsigned_long  LINUX_MIB_TCPMTUPSUCCESS
+unsigned_long  LINUX_MIB_TCPDELIVEREDCE
+unsigned_long  LINUX_MIB_TCPACKCOMPRESSED
+unsigned_long  LINUX_MIB_TCPZEROWINDOWDROP
+unsigned_long  LINUX_MIB_TCPRCVQDROP
+unsigned_long  LINUX_MIB_TCPWQUEUETOOBIG
+unsigned_long  LINUX_MIB_TCPFASTOPENPASSIVEALTKEY
+unsigned_long  LINUX_MIB_TCPTIMEOUTREHASH
+unsigned_long  LINUX_MIB_TCPDUPLICATEDATAREHASH
+unsigned_long  LINUX_MIB_TCPDSACKRECVSEGS
+unsigned_long  LINUX_MIB_TCPDSACKIGNOREDDUBIOUS
+unsigned_long  LINUX_MIB_TCPMIGRATEREQSUCCESS
+unsigned_long  LINUX_MIB_TCPMIGRATEREQFAILURE
+unsigned_long  __LINUX_MIB_MAX
+============== ===================================== =================== =================== ==================================================
diff --git a/Documentation/networking/net_cachelines/tcp_sock.rst b/Documentation/networking/net_cachelines/tcp_sock.rst
index 1c154cbd1848..1f79765072b1 100644
--- a/Documentation/networking/net_cachelines/tcp_sock.rst
+++ b/Documentation/networking/net_cachelines/tcp_sock.rst
@@ -5,153 +5,155 @@
 tcp_sock struct fast path usage breakdown
 =========================================
 
+============================= ======================= =================== =================== ==================================================================================================================================================================================================================
 Type                          Name                    fastpath_tx_access  fastpath_rx_access  Comments
-..struct                      ..tcp_sock                                                        
-struct_inet_connection_sock   inet_conn                                                       
+============================= ======================= =================== =================== ==================================================================================================================================================================================================================
+struct inet_connection_sock   inet_conn
 u16                           tcp_header_len          read_mostly         read_mostly         tcp_bound_to_half_wnd,tcp_current_mss(tx);tcp_rcv_established(rx)
-u16                           gso_segs                read_mostly         -                   tcp_xmit_size_goal
+u16                           gso_segs                read_mostly                             tcp_xmit_size_goal
 __be32                        pred_flags              read_write          read_mostly         tcp_select_window(tx);tcp_rcv_established(rx)
-u64                           bytes_received          -                   read_write          tcp_rcv_nxt_update(rx)
-u32                           segs_in                 -                   read_write          tcp_v6_rcv(rx)
-u32                           data_segs_in            -                   read_write          tcp_v6_rcv(rx)
+u64                           bytes_received                              read_write          tcp_rcv_nxt_update(rx)
+u32                           segs_in                                     read_write          tcp_v6_rcv(rx)
+u32                           data_segs_in                                read_write          tcp_v6_rcv(rx)
 u32                           rcv_nxt                 read_mostly         read_write          tcp_cleanup_rbuf,tcp_send_ack,tcp_inq_hint,tcp_transmit_skb,tcp_receive_window(tx);tcp_v6_do_rcv,tcp_rcv_established,tcp_data_queue,tcp_receive_window,tcp_rcv_nxt_update(write)(rx)
-u32                           copied_seq              -                   read_mostly         tcp_cleanup_rbuf,tcp_rcv_space_adjust,tcp_inq_hint
-u32                           rcv_wup                 -                   read_write          __tcp_cleanup_rbuf,tcp_receive_window,tcp_receive_established
+u32                           copied_seq                                  read_mostly         tcp_cleanup_rbuf,tcp_rcv_space_adjust,tcp_inq_hint
+u32                           rcv_wup                                     read_write          __tcp_cleanup_rbuf,tcp_receive_window,tcp_receive_established
 u32                           snd_nxt                 read_write          read_mostly         tcp_rate_check_app_limited,__tcp_transmit_skb,tcp_event_new_data_sent(write)(tx);tcp_rcv_established,tcp_ack,tcp_clean_rtx_queue(rx)
-u32                           segs_out                read_write          -                   __tcp_transmit_skb
-u32                           data_segs_out           read_write          -                   __tcp_transmit_skb,tcp_update_skb_after_send
-u64                           bytes_sent              read_write          -                   __tcp_transmit_skb
-u64                           bytes_acked             -                   read_write          tcp_snd_una_update/tcp_ack
-u32                           dsack_dups                                                      
+u32                           segs_out                read_write                              __tcp_transmit_skb
+u32                           data_segs_out           read_write                              __tcp_transmit_skb,tcp_update_skb_after_send
+u64                           bytes_sent              read_write                              __tcp_transmit_skb
+u64                           bytes_acked                                 read_write          tcp_snd_una_update/tcp_ack
+u32                           dsack_dups
 u32                           snd_una                 read_mostly         read_write          tcp_wnd_end,tcp_urg_mode,tcp_minshall_check,tcp_cwnd_validate(tx);tcp_ack,tcp_may_update_window,tcp_clean_rtx_queue(write),tcp_ack_tstamp(rx)
-u32                           snd_sml                 read_write          -                   tcp_minshall_check,tcp_minshall_update
-u32                           rcv_tstamp              -                   read_mostly         tcp_ack
-u32                           lsndtime                read_write          -                   tcp_slow_start_after_idle_check,tcp_event_data_sent
-u32                           last_oow_ack_time                                               
-u32                           compressed_ack_rcv_nxt                                          
+u32                           snd_sml                 read_write                              tcp_minshall_check,tcp_minshall_update
+u32                           rcv_tstamp                                  read_mostly         tcp_ack
+u32                           lsndtime                read_write                              tcp_slow_start_after_idle_check,tcp_event_data_sent
+u32                           last_oow_ack_time
+u32                           compressed_ack_rcv_nxt
 u32                           tsoffset                read_mostly         read_mostly         tcp_established_options(tx);tcp_fast_parse_options(rx)
-struct_list_head              tsq_node                -                   -                   
-struct_list_head              tsorted_sent_queue      read_write          -                   tcp_update_skb_after_send
-u32                           snd_wl1                 -                   read_mostly         tcp_may_update_window
+struct list_head              tsq_node
+struct list_head              tsorted_sent_queue      read_write                              tcp_update_skb_after_send
+u32                           snd_wl1                                     read_mostly         tcp_may_update_window
 u32                           snd_wnd                 read_mostly         read_mostly         tcp_wnd_end,tcp_tso_should_defer(tx);tcp_fast_path_on(rx)
-u32                           max_window              read_mostly         -                   tcp_bound_to_half_wnd,forced_push
+u32                           max_window              read_mostly                             tcp_bound_to_half_wnd,forced_push
 u32                           mss_cache               read_mostly         read_mostly         tcp_rate_check_app_limited,tcp_current_mss,tcp_sync_mss,tcp_sndbuf_expand,tcp_tso_should_defer(tx);tcp_update_pacing_rate,tcp_clean_rtx_queue(rx)
 u32                           window_clamp            read_mostly         read_write          tcp_rcv_space_adjust,__tcp_select_window
-u32                           rcv_ssthresh            read_mostly         -                   __tcp_select_window
+u32                           rcv_ssthresh            read_mostly                             __tcp_select_window
 u8                            scaling_ratio           read_mostly         read_mostly         tcp_win_from_space
-struct                        tcp_rack                                                        
-u16                           advmss                  -                   read_mostly         tcp_rcv_space_adjust
-u8                            compressed_ack                                                  
-u8:2                          dup_ack_counter                                                 
-u8:1                          tlp_retrans                                                     
+struct                        tcp_rack
+u16                           advmss                                      read_mostly         tcp_rcv_space_adjust
+u8                            compressed_ack
+u8:2                          dup_ack_counter
+u8:1                          tlp_retrans
 u8:1                          tcp_usec_ts             read_mostly         read_mostly
-u32                           chrono_start            read_write          -                   tcp_chrono_start/stop(tcp_write_xmit,tcp_cwnd_validate,tcp_send_syn_data)
-u32[3]                        chrono_stat             read_write          -                   tcp_chrono_start/stop(tcp_write_xmit,tcp_cwnd_validate,tcp_send_syn_data)
-u8:2                          chrono_type             read_write          -                   tcp_chrono_start/stop(tcp_write_xmit,tcp_cwnd_validate,tcp_send_syn_data)
-u8:1                          rate_app_limited        -                   read_write          tcp_rate_gen
-u8:1                          fastopen_connect                                                
-u8:1                          fastopen_no_cookie                                              
-u8:1                          is_sack_reneg           -                   read_mostly         tcp_skb_entail,tcp_ack
-u8:2                          fastopen_client_fail                                            
-u8:4                          nonagle                 read_write          -                   tcp_skb_entail,tcp_push_pending_frames
-u8:1                          thin_lto                                                        
-u8:1                          recvmsg_inq                                                     
-u8:1                          repair                  read_mostly         -                   tcp_write_xmit
-u8:1                          frto                                                            
-u8                            repair_queue            -                   -                   
-u8:2                          save_syn                                                        
-u8:1                          syn_data                                                        
-u8:1                          syn_fastopen                                                    
-u8:1                          syn_fastopen_exp                                                
-u8:1                          syn_fastopen_ch                                                 
-u8:1                          syn_data_acked                                                  
-u8:1                          is_cwnd_limited         read_mostly         -                   tcp_cwnd_validate,tcp_is_cwnd_limited
-u32                           tlp_high_seq            -                   read_mostly         tcp_ack
-u32                           tcp_tx_delay                                                    
-u64                           tcp_wstamp_ns           read_write          -                   tcp_pacing_check,tcp_tso_should_defer,tcp_update_skb_after_send
+u32                           chrono_start            read_write                              tcp_chrono_start/stop(tcp_write_xmit,tcp_cwnd_validate,tcp_send_syn_data)
+u32[3]                        chrono_stat             read_write                              tcp_chrono_start/stop(tcp_write_xmit,tcp_cwnd_validate,tcp_send_syn_data)
+u8:2                          chrono_type             read_write                              tcp_chrono_start/stop(tcp_write_xmit,tcp_cwnd_validate,tcp_send_syn_data)
+u8:1                          rate_app_limited                            read_write          tcp_rate_gen
+u8:1                          fastopen_connect
+u8:1                          fastopen_no_cookie
+u8:1                          is_sack_reneg                               read_mostly         tcp_skb_entail,tcp_ack
+u8:2                          fastopen_client_fail
+u8:4                          nonagle                 read_write                              tcp_skb_entail,tcp_push_pending_frames
+u8:1                          thin_lto
+u8:1                          recvmsg_inq
+u8:1                          repair                  read_mostly                             tcp_write_xmit
+u8:1                          frto
+u8                            repair_queue
+u8:2                          save_syn
+u8:1                          syn_data
+u8:1                          syn_fastopen
+u8:1                          syn_fastopen_exp
+u8:1                          syn_fastopen_ch
+u8:1                          syn_data_acked
+u8:1                          is_cwnd_limited         read_mostly                             tcp_cwnd_validate,tcp_is_cwnd_limited
+u32                           tlp_high_seq                                read_mostly         tcp_ack
+u32                           tcp_tx_delay
+u64                           tcp_wstamp_ns           read_write                              tcp_pacing_check,tcp_tso_should_defer,tcp_update_skb_after_send
 u64                           tcp_clock_cache         read_write          read_write          tcp_mstamp_refresh(tcp_write_xmit/tcp_rcv_space_adjust),__tcp_transmit_skb,tcp_tso_should_defer;timer
 u64                           tcp_mstamp              read_write          read_write          tcp_mstamp_refresh(tcp_write_xmit/tcp_rcv_space_adjust)(tx);tcp_rcv_space_adjust,tcp_rate_gen,tcp_clean_rtx_queue,tcp_ack_update_rtt/tcp_time_stamp(rx);timer
 u32                           srtt_us                 read_mostly         read_write          tcp_tso_should_defer(tx);tcp_update_pacing_rate,__tcp_set_rto,tcp_rtt_estimator(rx)
-u32                           mdev_us                 read_write          -                   tcp_rtt_estimator
-u32                           mdev_max_us                                                     
-u32                           rttvar_us               -                   read_mostly         __tcp_set_rto
+u32                           mdev_us                 read_write                              tcp_rtt_estimator
+u32                           mdev_max_us
+u32                           rttvar_us                                   read_mostly         __tcp_set_rto
 u32                           rtt_seq                 read_write                              tcp_rtt_estimator
-struct_minmax                 rtt_min                 -                   read_mostly         tcp_min_rtt/tcp_rate_gen,tcp_min_rtttcp_update_rtt_min
+struct minmax                 rtt_min                                     read_mostly         tcp_min_rtt/tcp_rate_gen,tcp_min_rtttcp_update_rtt_min
 u32                           packets_out             read_write          read_write          tcp_packets_in_flight(tx/rx);tcp_slow_start_after_idle_check,tcp_nagle_check,tcp_rate_skb_sent,tcp_event_new_data_sent,tcp_cwnd_validate,tcp_write_xmit(tx);tcp_ack,tcp_clean_rtx_queue,tcp_update_pacing_rate(rx)
-u32                           retrans_out             -                   read_mostly         tcp_packets_in_flight,tcp_rate_check_app_limited
-u32                           max_packets_out         -                   read_write          tcp_cwnd_validate
-u32                           cwnd_usage_seq          -                   read_write          tcp_cwnd_validate
-u16                           urg_data                -                   read_mostly         tcp_fast_path_check
-u8                            ecn_flags               read_write          -                   tcp_ecn_send
-u8                            keepalive_probes                                                
-u32                           reordering              read_mostly         -                   tcp_sndbuf_expand
-u32                           reord_seen                                                      
+u32                           retrans_out                                 read_mostly         tcp_packets_in_flight,tcp_rate_check_app_limited
+u32                           max_packets_out                             read_write          tcp_cwnd_validate
+u32                           cwnd_usage_seq                              read_write          tcp_cwnd_validate
+u16                           urg_data                                    read_mostly         tcp_fast_path_check
+u8                            ecn_flags               read_write                              tcp_ecn_send
+u8                            keepalive_probes
+u32                           reordering              read_mostly                             tcp_sndbuf_expand
+u32                           reord_seen
 u32                           snd_up                  read_write          read_mostly         tcp_mark_urg,tcp_urg_mode,__tcp_transmit_skb(tx);tcp_clean_rtx_queue(rx)
-struct_tcp_options_received   rx_opt                  read_mostly         read_write          tcp_established_options(tx);tcp_fast_path_on,tcp_ack_update_window,tcp_is_sack,tcp_data_queue,tcp_rcv_established,tcp_ack_update_rtt(rx)
-u32                           snd_ssthresh            -                   read_mostly         tcp_update_pacing_rate
+struct tcp_options_received   rx_opt                  read_mostly         read_write          tcp_established_options(tx);tcp_fast_path_on,tcp_ack_update_window,tcp_is_sack,tcp_data_queue,tcp_rcv_established,tcp_ack_update_rtt(rx)
+u32                           snd_ssthresh                                read_mostly         tcp_update_pacing_rate
 u32                           snd_cwnd                read_mostly         read_mostly         tcp_snd_cwnd,tcp_rate_check_app_limited,tcp_tso_should_defer(tx);tcp_update_pacing_rate
-u32                           snd_cwnd_cnt                                                    
-u32                           snd_cwnd_clamp                                                  
-u32                           snd_cwnd_used                                                   
-u32                           snd_cwnd_stamp                                                  
-u32                           prior_cwnd                                                      
-u32                           prr_delivered                                                   
+u32                           snd_cwnd_cnt
+u32                           snd_cwnd_clamp
+u32                           snd_cwnd_used
+u32                           snd_cwnd_stamp
+u32                           prior_cwnd
+u32                           prr_delivered
 u32                           prr_out                 read_mostly         read_mostly         tcp_rate_skb_sent,tcp_newly_delivered(tx);tcp_ack,tcp_rate_gen,tcp_clean_rtx_queue(rx)
 u32                           delivered               read_mostly         read_write          tcp_rate_skb_sent, tcp_newly_delivered(tx);tcp_ack, tcp_rate_gen, tcp_clean_rtx_queue (rx)
 u32                           delivered_ce            read_mostly         read_write          tcp_rate_skb_sent(tx);tcp_rate_gen(rx)
-u32                           lost                    -                   read_mostly         tcp_ack
+u32                           lost                                        read_mostly         tcp_ack
 u32                           app_limited             read_write          read_mostly         tcp_rate_check_app_limited,tcp_rate_skb_sent(tx);tcp_rate_gen(rx)
-u64                           first_tx_mstamp         read_write          -                   tcp_rate_skb_sent
-u64                           delivered_mstamp        read_write          -                   tcp_rate_skb_sent
-u32                           rate_delivered          -                   read_mostly         tcp_rate_gen
-u32                           rate_interval_us        -                   read_mostly         rate_delivered,rate_app_limited
+u64                           first_tx_mstamp         read_write                              tcp_rate_skb_sent
+u64                           delivered_mstamp        read_write                              tcp_rate_skb_sent
+u32                           rate_delivered                              read_mostly         tcp_rate_gen
+u32                           rate_interval_us                            read_mostly         rate_delivered,rate_app_limited
 u32                           rcv_wnd                 read_write          read_mostly         tcp_select_window,tcp_receive_window,tcp_fast_path_check
-u32                           write_seq               read_write          -                   tcp_rate_check_app_limited,tcp_write_queue_empty,tcp_skb_entail,forced_push,tcp_mark_push
-u32                           notsent_lowat           read_mostly         -                   tcp_stream_memory_free
-u32                           pushed_seq              read_write          -                   tcp_mark_push,forced_push
+u32                           write_seq               read_write                              tcp_rate_check_app_limited,tcp_write_queue_empty,tcp_skb_entail,forced_push,tcp_mark_push
+u32                           notsent_lowat           read_mostly                             tcp_stream_memory_free
+u32                           pushed_seq              read_write                              tcp_mark_push,forced_push
 u32                           lost_out                read_mostly         read_mostly         tcp_left_out(tx);tcp_packets_in_flight(tx/rx);tcp_rate_check_app_limited(rx)
 u32                           sacked_out              read_mostly         read_mostly         tcp_left_out(tx);tcp_packets_in_flight(tx/rx);tcp_clean_rtx_queue(rx)
-struct_hrtimer                pacing_timer                                                    
-struct_hrtimer                compressed_ack_timer                                            
-struct_sk_buff*               lost_skb_hint           read_mostly                             tcp_clean_rtx_queue
-struct_sk_buff*               retransmit_skb_hint     read_mostly         -                   tcp_clean_rtx_queue
-struct_rb_root                out_of_order_queue      -                   read_mostly         tcp_data_queue,tcp_fast_path_check
-struct_sk_buff*               ooo_last_skb                                                    
-struct_tcp_sack_block[1]      duplicate_sack                                                  
-struct_tcp_sack_block[4]      selective_acks                                                  
-struct_tcp_sack_block[4]      recv_sack_cache                                                 
-struct_sk_buff*               highest_sack            read_write          -                   tcp_event_new_data_sent
-int                           lost_cnt_hint                                                   
-u32                           prior_ssthresh                                                  
-u32                           high_seq                                                        
-u32                           retrans_stamp                                                   
-u32                           undo_marker                                                     
-int                           undo_retrans                                                    
-u64                           bytes_retrans                                                   
-u32                           total_retrans                                                   
-u32                           rto_stamp                                                       
-u16                           total_rto                                                       
-u16                           total_rto_recoveries                                            
-u32                           total_rto_time                                                  
-u32                           urg_seq                 -                   -                   
-unsigned_int                  keepalive_time                                                  
-unsigned_int                  keepalive_intvl                                                 
-int                           linger2                                                         
-u8                            bpf_sock_ops_cb_flags                                           
-u8:1                          bpf_chg_cc_inprogress                                           
-u16                           timeout_rehash                                                  
-u32                           rcv_ooopack                                                     
-u32                           rcv_rtt_last_tsecr                                              
-struct                        rcv_rtt_est             -                   read_write          tcp_rcv_space_adjust,tcp_rcv_established
-struct                        rcvq_space              -                   read_write          tcp_rcv_space_adjust
-struct                        mtu_probe                                                       
-u32                           plb_rehash                                                      
-u32                           mtu_info                                                        
-bool                          is_mptcp                                                        
-bool                          smc_hs_congested                                                
-bool                          syn_smc                                                         
-struct_tcp_sock_af_ops*       af_specific                                                     
-struct_tcp_md5sig_info*       md5sig_info                                                     
-struct_tcp_fastopen_request*  fastopen_req                                                    
-struct_request_sock*          fastopen_rsk                                                    
-struct_saved_syn*             saved_syn                                                        
\ No newline at end of file
+struct hrtimer                pacing_timer
+struct hrtimer                compressed_ack_timer
+struct sk_buff*               lost_skb_hint           read_mostly                             tcp_clean_rtx_queue
+struct sk_buff*               retransmit_skb_hint     read_mostly                             tcp_clean_rtx_queue
+struct rb_root                out_of_order_queue                          read_mostly         tcp_data_queue,tcp_fast_path_check
+struct sk_buff*               ooo_last_skb
+struct tcp_sack_block[1]      duplicate_sack
+struct tcp_sack_block[4]      selective_acks
+struct tcp_sack_block[4]      recv_sack_cache
+struct sk_buff*               highest_sack            read_write                              tcp_event_new_data_sent
+int                           lost_cnt_hint
+u32                           prior_ssthresh
+u32                           high_seq
+u32                           retrans_stamp
+u32                           undo_marker
+int                           undo_retrans
+u64                           bytes_retrans
+u32                           total_retrans
+u32                           rto_stamp
+u16                           total_rto
+u16                           total_rto_recoveries
+u32                           total_rto_time
+u32                           urg_seq
+unsigned_int                  keepalive_time
+unsigned_int                  keepalive_intvl
+int                           linger2
+u8                            bpf_sock_ops_cb_flags
+u8:1                          bpf_chg_cc_inprogress
+u16                           timeout_rehash
+u32                           rcv_ooopack
+u32                           rcv_rtt_last_tsecr
+struct                        rcv_rtt_est                                 read_write          tcp_rcv_space_adjust,tcp_rcv_established
+struct                        rcvq_space                                  read_write          tcp_rcv_space_adjust
+struct                        mtu_probe
+u32                           plb_rehash
+u32                           mtu_info
+bool                          is_mptcp
+bool                          smc_hs_congested
+bool                          syn_smc
+struct tcp_sock_af_ops*       af_specific
+struct tcp_md5sig_info*       md5sig_info
+struct tcp_fastopen_request*  fastopen_req
+struct request_sock*          fastopen_rsk
+struct saved_syn*             saved_syn
+============================= ======================= =================== =================== ==================================================================================================================================================================================================================
-- 
2.46.2


